# Note

## Learning

1. `Author`
2. `Description`
3. `Keywords`
4. `License`
5. `Version`
   - SemVer(Semantic Versioning )

       ```json
       {"package": "MAJOR.MINOR.PATCH"}
       ```

     The MAJOR version should increment when you make incompatible API changes. The MINOR version should increment when you add functionality in a backwards-compatible manner. The PATCH version should increment when you make backwards-compatible bug fixes. This means that PATCHes are bug fixes and MINORs add new features but neither of them break what worked before. Finally, MAJORs add changes that won’t work with earlier versions.

   - tilde (~) character : Allow an npm dependency to update to the latest PATCH version

       ```json
       {"package": "~MAJOR.MINOR.PATCH"}
       ```

   - caret (^) character : Allow an npm dependency to update to the latest MINOR version

       ```json
       {"package": "^MAJOR.MINOR.PATCH"}
       ```

6. npm install
7. npm start
