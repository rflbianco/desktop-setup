### Datetime Indicator
gsettings set com.canonical.indicator.datetime show-auto-detected-location true
gsettings set com.canonical.indicator.datetime show-date true
gsettings set com.canonical.indicator.datetime show-day true
gsettings set com.canonical.indicator.datetime show-events false
gsettings set com.canonical.indicator.datetime show-locations true

### Battery / Power Indicator
gsettings set com.canonical.indicator.power show-percentage true
gsettings set com.canonical.indicator.power show-time true

### Appmenu Indicator
gsettings set com.canonical.Unity always-show-menus true

### Dash/Scopes
gsettings set com.canonical.Unity.Dash favorite-scopes "[]"
gsettings set com.canonical.Unity.Lenses always-search "['applications.scope']"
gsettings set com.canonical.Unity.Lenses home-lens-default-view "['applications.scope']"
gsettings set com.canonical.Unity.Lenses home-lens-priority "[]"
gsettings set com.canonical.Unity.Dash scopes "['home.scope', 'applications.scope']"

### Webapps
gsettings set com.canonical.unity.webapps preauthorized-domains "[]"
gsettings set com.canonical.unity.webapps integration-allowed false

### Launcher
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ icon-size 32
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ backlight-mode 2 #no colouring

### Switcher
gsettings set org.compiz.unityshell:/org/compiz/profiles/unity/plugins/unityshell/ disable-show-desktop true

### Workspace
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize "3"
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize "3"

### Hotcorners
gsettings set org.compiz.expo:/org/compiz/profiles/unity/plugins/expo/ expo-edge "|BottomLeft"
gsettings set org.compiz.scale:/org/compiz/profiles/unity/plugins/scale/ initiate-all-edge "|BottomRight"
gsettings set org.compiz.scale:/org/compiz/profiles/unity/plugins/scale/ initiate-edge "|TopRight"

### Window snapping
gsettings set org.compiz.grid:/org/compiz/profiles/unity/plugins/grid/ bottom-edge-action 2
gsettings set org.compiz.grid:/org/compiz/profiles/unity/plugins/grid/ bottom-left-corner-action 1
gsettings set org.compiz.grid:/org/compiz/profiles/unity/plugins/grid/ bottom-right-corner-action 3
gsettings set org.compiz.grid:/org/compiz/profiles/unity/plugins/grid/ top-edge-action 8
gsettings set org.compiz.grid:/org/compiz/profiles/unity/plugins/grid/ top-left-corner-action 7
gsettings set org.compiz.grid:/org/compiz/profiles/unity/plugins/grid/ top-right-corner-action 9

### Expose
# Enable
gsettings set org.compiz.profile:/org/compiz/profiles/unity/ plugins-with-set-keys "['unityshell', 'composite', 'expo', 'workarounds', 'commands', 'core', 'staticswitcher', 'fade', 'mousepoll', 'decor', 'opengl', 'scale', 'gnomecompat', 'matecompat', 'wall', 'grid', 'resize', 'vpswitch', 'place', 'switcher', 'animation', 'move', 'unitymtgrabhandles', 'ezoom', 'snap', 'session', 'scaleaddon']"
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ active-plugins "['core', 'composite', 'opengl', 'copytex', 'wall', 'grid', 'resize', 'vpswitch', 'place', 'move', 'regex', 'snap', 'session', 'commands', 'imgpng', 'mousepoll', 'compiztoolbox', 'animation', 'unitymtgrabhandles', 'expo', 'workarounds', 'fade', 'scale', 'ezoom', 'unityshell', 'scaleaddon']"

# Always show window-title on Scale
gsettings set org.compiz.scaleaddon:/org/compiz/profiles/unity/plugins/scaleaddon/ window-title 2
