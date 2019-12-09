using Vuforia;
using NUnit.Framework;
using UnityEngine;

internal class VuforiaPackageTestSuite
{
    private GameObject mARCamera; 
    
    [SetUp]
    public void SetUp()
    {
        mARCamera = new GameObject("ARCamera");

        var camera = mARCamera.AddComponent<Camera>();
        camera.nearClipPlane = 0.05f;
        camera.farClipPlane = 2000f;
        camera.clearFlags = CameraClearFlags.Color;
        camera.backgroundColor = Color.black;
        camera.depth = 1f;
        camera.allowHDR = false;

        mARCamera.AddComponent<AudioListener>();
        mARCamera.AddComponent<VuforiaBehaviour>();
    }
    
    [Test]
    public void VerifyARCamera()
    {
        Assert.IsNotNull(VuforiaBehaviour.Instance);
    }

    [TearDown]
    public void TearDown()
    {
        GameObject.DestroyImmediate(mARCamera);
    }
}
