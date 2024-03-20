using System.Collections;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEngine;


[System.Serializable]
public struct PatchInstances
{
    public UnityEditor.DefaultAsset birdPatch;
    public UnityEditor.DefaultAsset jetEnginePatch;
    public UnityEditor.DefaultAsset carEnginePatch;
    public UnityEditor.DefaultAsset clockPatch;
    public UnityEditor.DefaultAsset ballPatch;
    public UnityEditor.DefaultAsset cellPhonePatch;
    public UnityEditor.DefaultAsset telephoneBellPatch;
    public UnityEditor.DefaultAsset mouseClickPatch;
}
public class PdPatchManager : MonoBehaviour
{
    public PatchInstances patches;

    void Start()
    {

    }

}
