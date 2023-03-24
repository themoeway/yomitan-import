# Yomitan Import

> :wave: **This project is a community fork of [yomichan-import](https://github.com/FooSoft/yomichan-import)** (which was [sunset](https://foosoft.net/posts/sunsetting-the-yomichan-project/) by its owner on Feb 26 2023).
>
> The primary goal is to **keep the project alive by providing long-term support and fixing bugs**. (Feature improvements are considered secondary.)
>
> Since this is a distributed effort, we highly welcome new contributors! Feel free to browse the issue tracker, and you can find us on [TheMoeWay Discord](https://discord.gg/nhqjydaR8j) at [#colab-tmw-projects](https://discord.com/channels/617136488840429598/1081538711742844980)

Yomitan Import allows users of the [Yomitan](https://github.com/themoeway/yomitan) extension to import custom
dictionary files. It currently supports the following formats:

*   [JMdict XML](http://www.edrdg.org/jmdict/edict_doc.html)
*   [JMnedict XML](http://www.edrdg.org/enamdict/enamdict_doc.html)
*   [KANJIDIC2 XML](http://www.edrdg.org/kanjidic/kanjd2index.html)
*   [Rikai SQLite DB](https://www.polarcloud.com/getrcx/)
*   [EPWING](https://ja.wikipedia.org/wiki/EPWING):
    *   [Daijirin](https://en.wikipedia.org/wiki/Daijirin) (三省堂　スーパー大辞林)
    *   [Daijisen](https://en.wikipedia.org/wiki/Daijisen) (大辞泉)
    *   [Kenkyusha](https://en.wikipedia.org/wiki/Kenky%C5%ABsha%27s_New_Japanese-English_Dictionary) (研究社　新和英大辞典　第５版)
    *   [Kotowaza](http://www.web-nihongo.com/wn/dictionary/dic_21/d-index.html) (故事ことわざの辞典)
    *   [Meikyou](https://ja.wikipedia.org/wiki/%E6%98%8E%E9%8F%A1%E5%9B%BD%E8%AA%9E%E8%BE%9E%E5%85%B8) (明鏡国語辞典)
    *   [Kojien](https://ja.wikipedia.org/wiki/%E5%BA%83%E8%BE%9E%E8%8B%91) (広辞苑第六版 &bull; 付属資料)
    *   [Gakken](https://ja.wikipedia.org/wiki/%E5%AD%A6%E7%A0%94%E3%83%9B%E3%83%BC%E3%83%AB%E3%83%87%E3%82%A3%E3%83%B3%E3%82%B0%E3%82%B9) (学研国語大辞典 &bull; 古語辞典 &bull; 故事ことわざ辞典 &bull; 学研漢和大字典)

Yomitan Import is being expanded to support other EPWING dictionaries based on user demand. This is a mostly
non-technical (although laborious) process that requires writing regular expressions and creating font tables; volunteer
contributions are welcome.

<!-- TODO: fix image with "Yomitan" -->
![](img/import.png)

## Installation and Usage

Follow the steps outlined below to import your custom dictionary into Yomitan:

1.  Download a pre-built binary for Linux, Mac OS X or Windows from the [project
    page](https://github.com/themoeway/yomitan-import/releases).
2.  Launch the `yomichan-gtk` executable after extracting the entire archive (or `yomichan` from the command line).
3.  Specify the source path of the dictionary you wish to convert.
4.  Specify the target path of the dictionary ZIP archive that you wish to create.
5.  Press the button labeled *Import dictionary...* and wait for processing to complete.
6.  On the Yomitan options page, browse to the dictionary ZIP archive file you created.
7.  Wait for the import progress to complete before closing the options page.

**Notice**: When converting EPWING dictionaries on Windows, it is important that the dictionary path you provide does
not contain non-ASCII characters (including Japanese characters). This problem is due to the fact that the EPWING
library used does not support such paths. Attempts to convert dictionaries stored in paths containing illegal characters
may cause the conversion process to fail.

## Building
> **Note**: Currently, building from source only works on Linux and MacOS.

1. Download the latest version of [go](https://go.dev/dl/) if you haven't already.
    Be sure to follow the [installation steps](https://go.dev/doc/install)
    as well, to ensure `go` is added to your path.
1. Run the following commands:

    ```bash
    git clone https://github.com/themoeway/yomitan-import.git
    cd scripts
    ./build_linux.sh
    ```
1. (Optional) If you want to build for Windows,
    install [mingw-w64](https://www.mingw-w64.org/downloads/)
    and run the following command under the `scripts` folder:

    ```
    ./build_windows.sh
    ```

## Building Dictionaries
If you have successfully built the `yomichan` binary (`yomichan-gtk` does not need to be successfully built),
then you should be able to run the `./build_dicts.sh` script, in order to build
all JMdict-related dictionaries.

Note that you will have to set your `$GOPATH` environment variable, i.e. with:
```bash
export GOPATH=$HOME/go
```
You will also have to add the GOPATH's `bin` folder to your `$PATH` environment variable, i.e. with:
```bash
export PATH=$PATH:$GOPATH/bin
```
