using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Zad1 : MonoBehaviour
{
    public int numberOfObjectsToGenerate = 10; // Obiekty do wygenerowania, publiczna zmienna do zmiany w edytorze, Domyślnie dziesięć
    public GameObject block;
    public Material[] materials; // Tablica materialow dla obiektow

    void Start()
    {
        GenerateRandomObjects(); // wygeneruj randomowe obiekty w losowych miejscach
    }

    void GenerateRandomObjects()
    {
        for (int i = 0; i < numberOfObjectsToGenerate; i++) // petla po liczbie podanej w edytorze unity
        {
            float xPos = Random.Range(transform.position.x - 5, transform.position.x + 5);
            float zPos = Random.Range(transform.position.z - 5, transform.position.z + 5);

            Vector3 randomPosition = new Vector3(xPos, 0.5f, zPos); // X i Z ustawione na podstawie planszy, Y = 0.5, aby wszystko znalazlo sie na niej
            GameObject newBlock = Instantiate(block, randomPosition, Quaternion.identity);

            if (materials.Length > 0)
            {
                Material randomMaterial = materials[Random.Range(0, materials.Length)];
                MeshRenderer renderer = newBlock.GetComponent<MeshRenderer>();
                if (renderer != null)
                {
                    renderer.material = randomMaterial; // przypisanie materialu obiektowi
                }
            }
        }
    }
}