global class PostInstallClass implements InstallHandler {
    global void onInstall(InstallContext context) {
        Account a = new Account();
        Integer randomNumber = Integer.valueof((Math.random() * 1000000));
        a.Name = 'New Son Account '+randomNumber;

        insert a;
    }
}