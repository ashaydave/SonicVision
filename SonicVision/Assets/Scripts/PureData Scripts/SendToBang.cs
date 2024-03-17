using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SendToBang : MonoBehaviour
{
    public LibPdInstance pdPatch;

    private void Update()
    {
        pdPatch.SendSymbol("speed","50");
    }
}
