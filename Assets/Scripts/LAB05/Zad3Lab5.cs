using UnityEngine;
using System.Collections.Generic;

public class Zad33 : MonoBehaviour
{
    [SerializeField] private List<Vector3> waypoints = new List<Vector3>();
    [SerializeField] private int currentWaypointIndex = 0;
    [SerializeField] private float speed = 15f;
    [SerializeField] private bool loop = true;

    private bool isForward = true;

    void Update()
    {
        if (waypoints.Count == 0)
            return;

        // transition the platform to the actual point
        Vector3 targetWaypoint = waypoints[currentWaypointIndex];
        transform.position = Vector3.MoveTowards(transform.position, targetWaypoint, speed * Time.deltaTime);

        // check if platform is on waypoint coordinates
        if (transform.position == targetWaypoint)
        {
            if (isForward)
            {
                if (currentWaypointIndex >= waypoints.Count - 1)
                {
                    if (loop)
                    {
                        currentWaypointIndex = waypoints.Count - 1;
                        isForward = false; // reverse the direction
                    }
                    else
                    {
                        currentWaypointIndex = 0;
                    }
                }
                else
                {
                    currentWaypointIndex++;
                }
            }
            else
            {
                if (currentWaypointIndex <= 0)
                {
                    currentWaypointIndex = 0;
                    isForward = true;
                }
                else
                {
                    currentWaypointIndex--;
                }
            }
        }
    }
}