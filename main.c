#include <stdio.h>
#include <math.h>

#define OK 0
#define ERR_IO 1
#define ERR_RANGE 2
#define TRIANGLE_COLLINEAR_POINTS_OR_COINCIDENT_VERTICES 3
#define TRIANGLE_VALID 4
#define POINT_INSIDE_TRIANGLE 5
#define POINT_ON_EDGE_OR_VERTEX 6
#define POINT_OUTSIDE_TRIANGLE 7
#define EPS 1e-9

// Вычисление площади треугольника по формуле через координаты вершин
double triangle_area(double xa, double ya, double xb, double yb, double xc, double yc)
{
    // Формула площади треугольника через определитель матрицы координат
    return fabs((xa * (yb - yc) + xb * (yc - ya) + xc * (ya - yb)) / 2.0);
}

// Проверка, являются ли три точки вершинами правильного треугольника
int is_valid_triangle(double xa, double ya, double xb, double yb, double xc, double yc)
{
    // Проверка, лежат ли точки на одной прямой (коллинеарность)
    if (fabs(xa * (yb - yc) - ya * (xb - xc) + xb * yc - yb * xc) < EPS)
    {
        // Точки коллинеарны, треугольник не существует
        return TRIANGLE_COLLINEAR_POINTS_OR_COINCIDENT_VERTICES;
    }
    // Проверка, не совпадают ли какие-то две вершины
    if ((fabs(xa - xb) < EPS && fabs(ya - yb) < EPS) ||
        (fabs(xb - xc) < EPS && fabs(yb - yc) < EPS) ||
        (fabs(xa - xc) < EPS && fabs(ya - yc) < EPS))
    {
        // Совпадающие вершины, треугольник не существует
        return TRIANGLE_COLLINEAR_POINTS_OR_COINCIDENT_VERTICES;
    }
    // Все проверки пройдены, точки образуют правильный треугольник
    return TRIANGLE_VALID;
}

// Определение положения точки относительно треугольника
int check_point_in_triangle(double xa, double ya, double xb, double yb, double xc, double yc, double xp, double yp)
{
    // Вычисление площади основного треугольника ABC
    double area_abc = triangle_area(xa, ya, xb, yb, xc, yc);
    // Вычисление площади треугольников ABP, BCP и CAP
    double area_abp = triangle_area(xa, ya, xb, yb, xp, yp);
    double area_bcp = triangle_area(xb, yb, xc, yc, xp, yp);
    double area_cap = triangle_area(xc, yc, xa, ya, xp, yp);
    // Сравнивнение суммы площадей малых треугольников с площадью большого треугольника
    if (fabs(area_abp + area_bcp + area_cap - area_abc) < EPS)
    {
        // Если суммы площадей равны, то точка P либо внутри, либо на границе треугольника
        // Проверка, все ли малые площади больше нуля (точка строго внутри треугольника)
        if (area_abp > EPS && area_bcp > EPS && area_cap > EPS)
        {
            // Точка внутри треугольника
            return POINT_INSIDE_TRIANGLE;
        }
        else
        {
            // Точка на границе треугольника (ребро или вершина)
            return POINT_ON_EDGE_OR_VERTEX;
        }
    }
    else
    {
        // Сумма площадей не совпадает, значит точка вне треугольника
        return POINT_OUTSIDE_TRIANGLE;
    }
}

int main(void)
{
    double xa, ya, xb, yb, xc, yc, xp, yp;
    int result;
    printf("Input coordinates of the triangle and the point: ");
    if (scanf("%lf%lf%lf%lf%lf%lf%lf%lf", &xa, &ya, &xb, &yb, &xc, &yc, &xp, &yp) != 8)
    {
        printf("IO error\n");
        return ERR_IO;
    }
    if (is_valid_triangle(xa, ya, xb, yb, xc, yc) != TRIANGLE_VALID)
    {
        printf("Not a triangle\n");
        return ERR_RANGE;
    }
    result = check_point_in_triangle(xa, ya, xb, yb, xc, yc, xp, yp);
    if (result == POINT_INSIDE_TRIANGLE)
    {
        printf("0\n");
    }
    else if (result == POINT_ON_EDGE_OR_VERTEX)
    {
        printf("1\n");
    }
    else if (result == POINT_OUTSIDE_TRIANGLE)
    {
        printf("2\n");
    }

    return OK;
}
