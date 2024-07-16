# Vcpkg自定义仓库

## ffmpeg

- n4.4.3#0  基于vcpkg的4.4.3的版本加上flv支持hevc的patch

- n4.4.3#1 基于4.4.3#0 添加rkmpp-3588的patch

- n5.1.2#0 基于vcpkg的5.1.2的版本加上flv支持hevc的patch

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
          },
          {
            "name":"log-cpp"
          }
      ],
  	"overrides":[
  		{
  			"name":"ffmpeg",
  			"version-string":"4.4.3#1"
  		},
        {
            "name":"log-cpp",
            "version-string":"0.0.1#0"
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
              "repository":"http://git-inc.ovopark.com:6780/system/threadlibrary/vcpkg-registrys",
              "baseline":"dcaa7d678033ea647b1fbf663d837cfc0f7c1843",
              "packages":["ffmpeg","log-cpp"]
          }
      ]
  }
  ```

  