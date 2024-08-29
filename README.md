# welcome to my dotfiles
hey, i'm aura, and this is an attempt to declaratively manage my entire arch linux system.
i tried multiple tools, before, from stow, to ansible, to chezmoi, to less popular ones like dotter.
none of them really worked the way i wanted them to - stow was too imperative and hard to make it do exactly what i wanted,
chezmoi was similar in that it required the repository to mirror the home directory (but actually more annoyingly with attributes in filenames).
ansible was overly complex and overwhelming for my needs (basically feels like shell scripts with more overhead),
and dotter was the closest but still not quite there. so that brings me to now, where i decided that my needs were so particular
that i should just go full script mode. it's sort of inspired by aconfmgr, which i actually didn't try as i wasn't on arch when i started this.
but i knew of it and liked how it does everything in shell scripts that get automatically sourced.
i didn't like the idea of the `save` command though, and i wanted more control over other parts.

i also realized that this way i can literally script the entire installation of a new arch system,
so getting back up and running in the case of my pc getting borked should be much quicker.
see #bootstrap for more about that.

## regular usage
the `auto` command is the entry point. as the name suggests, it automatically sources all necessary scripts.
it's not *just* a delegator though, it tries to be helpful and friendly, and has a few internal helpers.

it can be modified directly of course, for global configuration changes or if you want to modify the structure.
but for things that are persistent but change more regularly (especially across different machines), you're gonna want to modify
variables and other things in `hosts/$HOSTNAME.sh` (automatically created and populated with desired values on first run).

### variables
obviously it's all bash and this is just how i've set it up, so you can literally do whatever you want.
but it looks for these variables by default:
- RICES - comma-separated list of \*.sh files (without extension) in `rices/`.
- APPS - functionally identical to RICES, just looks in `apps/` instead.
- THEME - also kind of similar, but it's expecting just one item under `themes/`
- TIMEZONE - defaults to America/New York
- LOCALE - can have multiple, space-separated. defaults to en\_US.UTF\_8
- LAYOUT - keyboard layout. defaults to qwerty

### file structure
i approached this with the goal of maintainability and ergonomics. basically, put things where they will be easiest to tweak & compose with in the future.

skipping `bootstrap.sh` (see #bootstrap if you want that), let's start with `auto.sh`.
usually you will run this not as `./auto.sh`, but just `auto` as it symlinks itself to `~/.local/bin` on first invocation.
that way you can run it from anywhere in your system, and i often do so from in a subdirectory as i am tweaking configs.
its behaviour has already been mostly described already, but see #helpers if you want a list of the ones `auto` provides by default.

`core.sh`: used for installing the basic packages required to have a running system 
(well, it only installs them when in bootstrap, but if they weren't here then they could potentially get removed.
and if they get removed, then you can't run the scripts.), as well as any dependencies for *running* the rest of the scripts.
it also handles setting basic system configs, like timezone, locale, keyboard layout, etc.

## bootstrap
to quickly get a *brand new* (live image) arch system going, run this:
```sh
curl -L https://github.com/auralluring/dotfiles/raw/master/bootstrap.sh | bash
```

if you have a functional system already that you want to insert this into, do a git clone and run `auto`:
```sh
# obviously install git if you don't have it already
git clone https://github.com/auralluring/dotfiles ~/.dotfiles
cd ~/.dotfiles
./auto.sh
```
