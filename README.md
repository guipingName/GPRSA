# RSA非对称加密 #

RSA非对称加密, 适用于Java和iOS

应用场景：用户登录时对登录密码进行加密

## 启动终端, 创建证书 ##

// create `private_key.pem`
```
openssl genrsa -out private_key.pem 1024
```

// create `rsaCertReq.csr`，这一步需要输入一些信息(包括国家、省、市等等)，根据提示操作即可
```
openssl req -new -key private_key.pem -out rsaCertReq.csr
```
// create `rsaCert.crt`,其中3650是有效期(天),可随意写
```
openssl x509 -req -days 3650 -in rsaCertReq.csr -signkey private_key.pem -out rsaCert.crt
```

// create `public_key.der`, For `iOS`
```
openssl x509 -outform der -in rsaCert.crt -out public_key.der
```

// create `private_key.p12`, For `iOS`, 这一步需要设置密码，请牢记
```
openssl pkcs12 -export -out private_key.p12 -inkey private_key.pem -in rsaCert.crt
 ```

// create `rsa_public_key.pem`, For `Java`
```
openssl rsa -in private_key.pem -out rsa_public_key.pem -pubout
```

// Create `pkcs8_private_key.pem`, For `Java`
```
openssl pkcs8 -topk8 -in private_key.pem -out pkcs8_private_key.pem -nocrypt
```

&emsp;&emsp;在终端执行上面的命令后，会生成7个文件。其中`public_key.der`和`private_key.p12`这对公私钥给`iOS`使用,`rsa_public_key.pem`和`pkcs8_private_key.pem`给`JAVA`使用。

&emsp;&emsp;它们的源都来自一个私钥：`private_key.pem`, 所以iOS端加密的数据，可以被JAVA端解密; 同样JAVA端加密的数据iOS端也能解密。

 
## iOS 代码 ##

　　请将`public_key.der`和`private_key.p12`文件拖入Xcode项目,以及`NSData+Base64.h/m`(可从网上下载), 并引入`Security.framework`依赖库。
  
