# CentOSにSoftware Collection(SCL)の導入する手順

## Software Collectionとは

RedHat Enterprise Linux, Fedora, CentOS, Scientific Linux用のソフトウェア集積地。

キーコンセプトとして、(yum等によって)インストールされたパッケージに影響を与えずに
同名コンポーネントの複数バージョンを構築し、インストールできることを打ち出している。

## 手順

Software Collectionを導入する。

```sh
sudo yum install centos-release-scl
sudo yum-config-manager --enable rhel-server-rhscl-6-rpms
```

SCLからPython2.7を導入してみる。

```sh
sudo yum install -y python27
```

SCLから導入されたPython2.7を有効にする。

```sh
# シェルからとりあえず一時的に使う
sudo scl enable python27 bash
```

```sh
# 起動時に有効化
echo 'source /opt/rh/python27/enable' > python27.sh
sudo chown root.root python27.sh
sudo mv python27.sh /etc/profile.d/
```