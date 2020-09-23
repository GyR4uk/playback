# playback

Clone this repository, install the dependencies and deploy
```
git clone https://github.com/GyR4uk/playback.git
cd playback
npm install
./deploy.sh
```

Include this at the end of nginx
```
location /playback {
  root /var/www/playbac;
  try_files $uri index.html;
}
```

Reload nginx service
```
sudo systemctl reload nginx
```

You will be able to play your recordings using the following URL
```
https://<domain>/playback/<recordId>
```

## URL query strings

- layout:
  - `l=media`
  - `l=content`
  - `l=disabled`

- style: custom style
  - `s=<name>`

- time:
  - `t=HhMmSs`
  - `t=MmSs`
  - `t=Ss`

- log:
  - `debug`

## Configuration

- chat:
  - `scroll`: automatic scroll [`true`|`false`]
  - `align`: scroll align [`top`|`middle`|`bottom`]

- controls:
  - `about`
  - `fullscreen`
  - `search`
  - `section`
  - `swap`
  - `thumbnails`

- monitor: posts server playback's usage data
  - `interval`: post frequency
  - `url`: server post destiny

- shortcuts: alt + shift
  - `fullscreen`: `K`
  - `section`: `L`
  - `slides`: skip
    - `next`: `ArrowUp`
    - `previous`: `ArrowDown`
  - `swap`: `M`
  - `thumbnails`: `N`
  - `video`: seek
    - `backward`: `ArrowLeft`
    - `forward`: `ArrowRight`
    - `seconds`: 15

- styles: custom styles
  - `default`: default style
  - `url`: styles host
  - `valid`: valid style names

- thumbnails:
  - `scroll`: automatic scroll [`true`|`false`]
  - `align`: scroll align [`left`|`center`|`right`]

- video: primary media configuration
  - `fps`: frames per second
  - `rates`: speed rates

## Standalone recordings

playback can be used to create a self-contained recording - a single directory that contains all of the recording media files as well as the playback html and javascript code. To do this, use the following build command:
```
PUBLIC_URL=. REACT_APP_NO_ROUTER=1 npm run-script build
```
And then copy all of the files from the 777playback `build` directory and the files from `/var/bigbluebutton/published/presentation/<recordid>` together into a single directory.
