# qt6-kirigami-container
Container image for kirigami app development. Created to be used as a devcontainer. An example devcontainer.json is also provided in this repository.

To get the QML extension in Zed working with custom-created QML components, I add these to the devcontainer.json's containerEnv:

```json
"QML_IMPORT_PATH": "/workspaces/PROJECT_NAME/build/bin",
"QML2_IMPORT_PATH": "/workspaces/PROJECT_NAME/build/bin",
```
