# opine

opine opens files in a predefined program according to its configuration file.
It can serve as an xdg-open replacement.

## Usage

```
usage: opine [options] FILE

options:
  -h         Show help message
  -t         Show mimetype of FILE
  -c CONFIG  Path to config
  -v         Show version
```

See [opine(1)](man/opine.1.pod) for more information.

## Configuration

opine looks for a configuration file at `$XDG_CONFIG_HOME/opine/config`
or falls back to `$HOME/.config/opine/config` if `$XDG_CONFIG_HOME` is unset.

The configuration file contains one **regex**=**cmd** mapping per line where:

* **regex** is a Bash regular expression matched against the *FILE*'s mimetype.
    * If **regex** is preceded by @, it is matched against the filename itself.
* **cmd** is the command to open *FILE* if it matches **regex**.

### Example configuration

```
@.*\.html=links
text/.*=less
```

The above configuration will open files with a `.html` extension in `links`
and files with any `text` mimetype in `less`.

## License

This project is licensed under the MIT License (see [LICENSE](LICENSE)).
