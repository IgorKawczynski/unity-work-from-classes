using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveWithCharacterControllerLab6 : MonoBehaviour
{
    private CharacterController controller;
    private Vector3 playerVelocity;
    private bool groundedPlayer;
    private float playerSpeed = 10.0f;
    private float jumpHeight = 1.0f;
    private float gravityValue = -9.81f;

    // Dodane zmienne do kontrolowania obrotu kamery
    private float cameraRotationX = 0.0f;
    public float cameraRotationSpeed = 2.0f;
    public float maxCameraRotationX = 90.0f;
    public float minCameraRotationX = -90.0f;

    private void Start()
    {
        controller = GetComponent<CharacterController>();
    }

    void Update()
    {

        // wyciągamy wartości, aby możliwe było ich efektywniejsze wykorzystanie w funkcji
        float moveX = Input.GetAxis("Horizontal");
        float moveZ = Input.GetAxis("Vertical");

        // dzięki parametrowi playerGrounded możemy dodać zachowania, które będą
        // mogły być uruchomione dla każdego z dwóch stanów
        groundedPlayer = controller.isGrounded;
        if (groundedPlayer && playerVelocity.y < 0)
        {
            playerVelocity.y = 0f;
        }

        // zmieniamy sposób poruszania się postaci
        // Vector3 move = new Vector3(Input.GetAxis("Horizontal"), 0, Input.GetAxis("Vertical"));
        // transform.right odpowiada za ruch wzdłuż osi x (pamiętajmy, że wartości będą zarówno dodatnie
        // jak i ujemne, a punkt (0,0) jest na środku ekranu) a transform.forward za ruch wzdłóż osi z.
        Vector3 move = transform.right * moveX + transform.forward * moveZ;
        controller.Move(move * Time.deltaTime * playerSpeed);


        // to już nam potrzebne nie będzie
        //if (move != Vector3.zero)
        //{
        //    gameObject.transform.forward = move;
        //}
        if (Input.GetButtonDown("Jump") && groundedPlayer)
        {
            // wzór na siłę 
            playerVelocity.y += Mathf.Sqrt(jumpHeight * -3.0f * gravityValue);
        }

        // prędkość swobodnego opadania zgodnie ze wzorem y = (1/2 * g) * t-kwadrat 
        // okazuje się, że jest to zbyt wolne opadanie, więc zastosowano g * t-kwadrat
        playerVelocity.y += gravityValue * Time.deltaTime;
        controller.Move(playerVelocity * Time.deltaTime);

        // // Fizyka ruszania myszką (pobranie najpierw osi X i Y)
        // float mouseX = Input.GetAxis("Mouse X");
        // float mouseY = Input.GetAxis("Mouse Y");

        // // Ograniczenie obrotu kamery
        // cameraRotationX -= mouseY * cameraRotationSpeed;
        // cameraRotationX = Mathf.Clamp(cameraRotationX, minCameraRotationX, maxCameraRotationX);

        // // rotacja kamery
        // transform.Rotate(Vector3.up * mouseX * cameraRotationSpeed);
        // Camera.main.transform.localRotation = Quaternion.Euler(cameraRotationX, 0, 0);
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("PRZESZKODA"))
        {
            Debug.Log("Player zahaczył o przeszkodę!");
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("PRZESZKODA"))
        {
            Debug.Log("Player oddalił się od przeszkody!");
        }
    }
}