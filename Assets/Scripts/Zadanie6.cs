using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Zadanie6 : MonoBehaviour
{
    public Transform target1; // Pierwszy cube śledzony
    public Transform target2; // Drugi cube śledzony
    public float smoothTime = 0.3f;
    private float yVelocity1 = 0.0f;
    private float yVelocity2 = 0.0f;

    void Update()
    {
        // Śledzenie pierwszego cube za pomocą Mathf.SmoothDamp
        float newPosition1 = Mathf.SmoothDamp(transform.position.y, target1.position.y, ref yVelocity1, smoothTime);
        transform.position = new Vector3(transform.position.x, newPosition1, transform.position.z);

        // Śledzenie drugiego cube za pomocą Mathf.Lerp
        float newPosition2 = Mathf.Lerp(transform.position.y, target2.position.y, smoothTime * Time.deltaTime);
        transform.position = new Vector3(transform.position.x, newPosition2, transform.position.z);
    }
}