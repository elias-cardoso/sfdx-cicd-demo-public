@IsTest
public with sharing class NewClassSonTest {
    @IsTest
    public static void NewClassSonTestPass() {
        NewClassSon nc = new NewClassSon();
        System.assertEquals(nc.value, 1);

        nc.setValue(2);

        System.assertNotEquals(nc.value, 1);
        System.assertEquals(nc.value, 2);
    }
}
