using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Zadanie2 : MonoBehaviour
{
    public float speed = 2.5f; // pole publiczne - mozna zmieniac w edytorze w czasie rzeczywistym
    private bool movingRight = true; // boolean do ruchu w prawo/lewo
    private Vector3 startPosition; // pozycja poczatkowa dla obiektu

    void Start()
    {
        // ustawienie pozycji startowej
        startPosition = transform.position;
    }

    void Update()
    {
        // czy przesuwac w prawo
        if (movingRight)
        {
            // Przesuniecie w prawo
            transform.Translate(Vector3.right * speed * Time.deltaTime);

            // Sprawdź, czy przesunelo 10 w prawo
            if (transform.position.x >= startPosition.x + 10)
            {
                // jesli tak, to teraz ruch w lewo
                movingRight = false;
            }
        }
        // czy przesuwac w lewo
        else
        {
            // Przesuniecie w lewo
            transform.Translate(Vector3.left * speed * Time.deltaTime);

            // Sprawdź, czy wrocilo do pozycji
            if (transform.position.x <= startPosition.x)
            {
                // jesli tak, to teraz ruch w prawo
                movingRight = true;
            }
        }
    }
}
