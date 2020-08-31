@IsTest
public with sharing class NewClassTest {
    @IsTest
    public static void NewClassTestPass() {
        NewClass nc = new NewClass();
        System.assertEquals(nc.value, 1);

        nc.setValue(2);

        System.assertNotEquals(nc.value, 1);
        System.assertEquals(nc.value, 2);
    }
}
