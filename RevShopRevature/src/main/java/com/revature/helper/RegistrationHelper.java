package com.revature.helper;

public class RegistrationHelper {

	public static boolean isValidEmail(String email) {
		// Basic email validation pattern
		String emailPattern = "^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$";
		return email != null && email.matches(emailPattern);
	}

	public static boolean isValidPassword(String password) {
		// Password must be at least 6 characters long, include an uppercase letter, a
		// number, and a special character
		String passwordPattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{6,}$";
		return password != null && password.matches(passwordPattern);
	}
	
	public static boolean isValidName(String name) {
        // Name should only contain letters and spaces, and be at least 1 character long
        return name != null && name.matches("[a-zA-Z\\s]+") && name.length() >= 1;
    }

    public static boolean isValidMobile(String mobile) {
        // Mobile number should be exactly 10 digits long
        return mobile != null && mobile.matches("\\d{10}");
    }

    public static boolean isValidPincode(String pincode) {
        // Pincode should be exactly 6 digits long
        return pincode != null && pincode.matches("\\d{6}");
    }

    public static boolean isValidAddress(String address) {
        // Address should not be null or empty
        return address != null && !address.trim().isEmpty();
    }

    public static boolean isValidGSTNumber(String gstNumber) {
        // GST number should be exactly 15 characters long
        return gstNumber == null || gstNumber.matches("\\d{15}");
    }

    public static boolean isValidURL(String url) {
        // URL should start with http or https
        return url == null || url.matches("^(http|https)://.+$");
    }

    public static boolean isValidPAN(String panNumber) {
        // PAN number format is 5 letters, 4 digits, and 1 letter
        return panNumber == null || panNumber.matches("[A-Z]{5}[0-9]{4}[A-Z]{1}");
    }

    public static boolean isValidBankAccount(String accountNumber) {
        // Bank account number should contain only digits
        return accountNumber == null || accountNumber.matches("\\d+");
    }

    public static boolean isValidIFSC(String ifsc) {
        // IFSC code should be exactly 11 characters long
        return ifsc == null || ifsc.matches("[A-Z]{4}0[A-Z0-9]{6}");
    }

}
