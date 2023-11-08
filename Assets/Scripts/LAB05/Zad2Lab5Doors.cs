using UnityEngine;

public class SlidingDoor : MonoBehaviour
{
    public float openSpeed = 3f;
    public float closeSpeed = 3f;
    public float openDistance = 2f;
    public bool isLeftWing;

    private Vector3 closePos;
    private Vector3 openPos;
    private bool isOpen;

    void Start()
    {
        closePos = transform.localPosition;
        // for left doors transition to right, for right doors transition to left
        openPos = closePos + (isLeftWing ? Vector3.left : Vector3.right) * openDistance;
    }

    void Update()
    {
        Vector3 targetPosition = isOpen ? openPos : closePos;
        transform.localPosition = Vector3.MoveTowards(transform.localPosition, targetPosition, (isOpen ? openSpeed : closeSpeed) * Time.deltaTime);
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            isOpen = true;
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            isOpen = false;
        }
    }
}