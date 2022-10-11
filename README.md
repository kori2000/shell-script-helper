# shell-script-helper
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://github.com/kori2000/telegram-bot/blob/main/LICENSE)
[![Unicorn](https://img.shields.io/badge/nyancat-approved-ff69b4.svg)](https://www.youtube.com/watch?v=QH2-TGUlwu4)

A collection of useful shell scripts.

### Scripts

-🚀 `getkeys.sh` : All public keys of the GitHub user are downloaded and written to the `authorized_keys` file

#### Example
```
curl -# https://raw.githubusercontent.com/kori2000/shell-script-helper/main/getkeys.sh | bash /dev/stdin <<GitHub_User>>
```

#### Shortener
```
curl -# https://kori.rip/sh/<<GitHub_User>> | bash
```

#### Demo Shortener
curl -# https://kori.rip/sh/kori2000 | bash

```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)