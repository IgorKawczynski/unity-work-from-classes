using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Zadanie5 : MonoBehaviour
{
    public GameObject cubePrefab; // Publiczny atrybut dla prefabu (typu Cube) - można w edytore unity wrzucic
    public float spawnSize = 10.0f; // Rozmiar planszy

    private List<Vector3> spawnPoints = new List<Vector3>(); // Spawner

    void Start()
    {
        // Tworzenie listy dostępnych punktów do spawnowania na planszy
        for (float x = -spawnSize / 2; x < spawnSize / 2; x += 1.0f)
        {
            for (float z = -spawnSize / 2; z < spawnSize / 2; z += 1.0f)
            {
                spawnPoints.Add(new Vector3(x, 0.5f, z)); // dodanie punktów spawnujących
            }
        }

        // Tworzenie 10 Cube na losowych, wyzej wyznaczonych spawnach
        for (int i = 0; i < 10; i++)
        {
            if (spawnPoints.Count > 0)
            {
                int randomIndex = Random.Range(0, spawnPoints.Count);
                Vector3 spawnPosition = spawnPoints[randomIndex];
                // instancjonowanie cube
                Instantiate(cubePrefab, spawnPosition, Quaternion.identity);
                spawnPoints.RemoveAt(randomIndex);
            }
        }
    }
}
