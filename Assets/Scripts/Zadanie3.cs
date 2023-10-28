using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Zadanie3 : MonoBehaviour
{
    public float speed = 3.5f; // Pole publiczne - można zmieniać w edytorze w czasie rzeczywistym
    private Vector3[] points; // Punkty z kwadratu
    private int currentPoint = 0; // Indeks punktu kwadratu (wierzcholka)
    private Vector3 direction = Vector3.right; // Startowy kierunek

    void Start()
    {
        // Ustawienie wierzcholkow (w formie listy punktow) - kwadrat o boku 10j
        points = new Vector3[5]; // ustawienie tablicvy na 5 elementow
        points[0] = transform.position; // Pozycja startowa
        points[1] = transform.position + Vector3.right * 10; // W prawo
        points[2] = points[1] + Vector3.forward * 10; // W przód
        points[3] = points[2] - Vector3.right * 10; // W lewo
        points[4] = points[0]; // W dół/tył
    }

    void Update()
    {
        // Ruch w kierunku punktu docelowego
        transform.position = Vector3.MoveTowards(transform.position, points[currentPoint], speed * Time.deltaTime);

        // Obracanie cube'm w kierunku ze zmiennej direction
        Vector3 targetDirection = (points[currentPoint] - transform.position).normalized;
        if (targetDirection != Vector3.zero)
        {
            transform.rotation = Quaternion.LookRotation(targetDirection);
        }

        // sprawdzenie, czy cube jest na wierzcholku kwadratu
        if (Vector3.Distance(transform.position, points[currentPoint]) < 0.1f)
        {
            // Obrót o 90 stopni w prawo w przypadku ruchu w prawo lub o 90 stopni w lewo w przypadku ruchu w lewo
            if (currentPoint%2 == 1)
            {
                direction = Quaternion.Euler(0, 90, 0) * direction; // Obrót o 90 stopni
            }

            // Ruch do kolejnego wierzcholka
            currentPoint = (currentPoint + 1) % points.Length;
        }
    }
}