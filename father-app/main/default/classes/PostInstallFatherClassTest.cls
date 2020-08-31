// Test for the post install class
@isTest
private class PostInstallFatherClassTest {
    @isTest           
    public static void test() {
      PostInstallFatherClass myClass = new PostInstallFatherClass();
      Test.testInstall(myClass, null);
    }
}         