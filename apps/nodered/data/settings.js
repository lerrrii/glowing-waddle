/**
 * This is the default settings file provided by Node-RED,
 * modified so that TZ, credentialSecret, and adminAuth credentials
 * (username/password) are taken from environment variables.
 */

const bcrypt = require("bcryptjs");

// If TZ is set in the environment, Node.js will automatically
// pick it up. However, just in case you want to enforce it here:
if (process.env.TZ) {
    process.env.TZ = process.env.TZ;
}

module.exports = {
    /*******************************************************************************
     * Flow File and User Directory Settings
     ******************************************************************************/
    /** The file containing the flows. If not set, defaults to flows_<hostname>.json **/
    flowFile: "flows.json",

    /**
     * By default, credentials are encrypted in storage using a generated key.
     * To specify your own secret, set the following property. We read it
     * from NODE_RED_CREDENTIAL_SECRET. If not provided, no encryption key is set.
     * Note: if you change this in future, existing credentials cannot be decrypted!
     */
    credentialSecret: process.env.NODE_RED_CREDENTIAL_SECRET || false,

    /** 
     * By default, the flow JSON will be pretty-printed. 
     * Change to false to disable multi-line formatting.
     */
    flowFilePretty: true,

    /*******************************************************************************
     * Security
     ******************************************************************************/
    /**
     * To password protect the Node-RED editor and admin API, use adminAuth.
     * We read username/password from environment variables:
     *
     *   NODE_RED_USERNAME      → plain‐text username
     *   NODE_RED_PASSWORD      → plain‐text password
     *
     * The password is hashed at startup with bcrypt (salt rounds=8).
     * If either variable is missing, it falls back to:
     *   username: "admin", password: "admin"  (hashed at startup).
     */
    adminAuth: {
        type: "credentials",
        users: [
            {
                username: process.env.NODE_RED_USERNAME || "admin",
                password: bcrypt.hashSync(
                    process.env.NODE_RED_PASSWORD || "admin",
                    8
                ),
                permissions: "*"
            }
        ]
    },

    /**
     * (Other security settings such as httpNodeAuth or https can be added the same way,
     * reading from env vars if needed.)
     */

    /*******************************************************************************
     * Server Settings
     ******************************************************************************/
    /** the tcp port that the Node-RED web server is listening on */
    uiPort: process.env.PORT || 1880,

    /** Optionally restrict which host/interface Node-RED listens on */
    // uiHost: process.env.NODE_RED_UI_HOST || "0.0.0.0",

    /*******************************************************************************
     * Runtime Settings
     ******************************************************************************/
    logging: {
        console: {
            level: process.env.NODE_RED_LOG_LEVEL || "info",
            metrics: false,
            audit: false
        }
    },

    exportGlobalContextKeys: false,
    functionExternalModules: true,

    /*******************************************************************************
     * Editor Settings
     ******************************************************************************/
    editorTheme: {
        // disableEditor: false,
        // other theme options here if needed
    },

    /*******************************************************************************
     * Node Settings
     ******************************************************************************/
    debugMaxLength: 1000,
    mqttReconnectTime: 15000,
    serialReconnectTime: 15000
};
