<recipe folder="root://activities/Modularization">

    <merge from="root/AppAndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(projectOut)}/src/main/debug/AndroidManifest.xml" />
    <merge from="root/LibAndroidManifest.xml.ftl"
             to="${escapeXmlAttribute(projectOut)}/src/main/release/AndroidManifest.xml" />
    <merge from="root/res/values/manifest_strings.xml.ftl"
             to="${escapeXmlAttribute(resOut)}/values/strings.xml" />

</recipe>