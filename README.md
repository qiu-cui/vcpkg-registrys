# Vcpkg自定义仓库

## ffmpeg

- n4.4.3#0  基于vcpkg的4.4.3的版本加上flv支持hevc的patch

- n4.4.3#1 基于4.4.3#0 添加rkmpp-3588的patch

  ```
  //使用方式：在项目根目录添加两个文件"vcpkg.json","vcpkg-configuration.json"
  //编译rkmpp版本示例
  // vcpkg.json 
  {
      "dependencies":[
          {
              "name":"ffmpeg",
              "features":[
                  "rkmpp",
              ]
          }
      ],
  	"overrides":[
  		{
  			"name":"ffmpeg",
  			"version-string":"4.4.3#1"
  		}
  	]
  }
  
  //vcpkg-configuration.json
  {
      "default-registry": {
          "kind": "git",
          "repository": "https://github.com/microsoft/vcpkg",
          "baseline": "0895a813036f4d189e2bdd1b62741744614347b4"
      },
      "registries": [
          {
              "kind":"git",
              "repository":"https://github.com/qiu-cui/vcpkg-ports",
              "baseline":"ee75e89c61ae8f294613780ff9283c27ee1d3a34",
              "packages":["ffmpeg"]
          }
      ]
  }
  ```

  