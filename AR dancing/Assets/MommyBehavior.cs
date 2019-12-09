using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MommyBehavior : MonoBehaviour
{
    public Animator Animator;
    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(calculTime());
    }

    // Update is called once per frame
    IEnumerator calculTime()
    {
        yield return new WaitForSeconds(4.75f);
        Animator.SetBool("run",true);
    }
}
