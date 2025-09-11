Part 1: Generate the Garmin Developer Key
The key is a file you'll generate on your computer. You'll need access to a command line interface that has OpenSSL installed, which is standard on most macOS and Linux machines. For Windows, you might need to install it separately.

Open a terminal or command prompt.

Generate a 4096-bit RSA key:

openssl genpkey -algorithm RSA -out private_key.pem -outform PEM -pkeyopt rsa_keygen_bits:4096
This command creates an unencrypted private key file named private_key.pem.

Convert the key to DER format:

openssl pkcs8 -topk8 -inform PEM -outform DER -in private_key.pem -out private_key.der -nocrypt
This second command converts the key to the DER format, which is required by the Garmin Connect IQ compiler. The output file, private_key.der, is your developer key. You'll need the contents of this file for the next step.

Part 2: Add the Key to GitHub Secrets
This process makes the key available to your GitHub Actions workflows without exposing its contents in your repository's code.

Open your web browser and navigate to your GitHub repository.

Go to the "Settings" tab.

In the left sidebar, click on "Secrets and variables" and then select "Actions".

Click the "New repository secret" button.

Name the secret: A common convention is to use a name like GARMIN_DEVELOPER_KEY.

Paste the key's content:

Open the private_key.der file you created in the previous step using a text editor or a command that can display binary content as text (e.g., xxd -p private_key.der on Linux/macOS).

Copy the entire contents of the file.

Paste the content into the "Secret" field on the GitHub page.

Click "Add secret".

Your developer key is now securely stored as a GitHub secret and can be used in your GitHub Actions workflows to sign your Garmin Connect IQ apps.
