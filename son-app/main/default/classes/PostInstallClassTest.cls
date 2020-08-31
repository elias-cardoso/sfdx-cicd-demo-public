// Test for the post install class
@isTest
private class PostInstallClassTest {
    @isTest           
    public static void test() {
      PostInstallClass myClass = new PostInstallClass();
      Test.testInstall(myClass, null);
    }
}         