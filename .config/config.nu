use std/util "path add"

let fish_completer = {|spans|
    fish --command $'complete "--do-complete=($spans | str join " ")"'
    | from tsv --flexible --noheaders --no-infer
    | rename value description
}

# This completer will use carapace by default
let external_completer = {|spans|
    let expanded_alias = scope aliases
    | where name == $spans.0
    | get -i 0.expansion

    let spans = if $expanded_alias != null {
        $spans
        | skip 1
        | prepend ($expanded_alias | split row ' ' | take 1)
    } else {
        $spans
    }

    match $spans.0 {
        # carapace completions are incorrect for nu
        nu => $fish_completer
        # fish completes commits and branch names in a nicer way
        git => $fish_completer
        _ => $fish_completer
        # _ => $carapace_completer
    } | do $in $spans
}

$env.config = {
    buffer_editor: "nvim"
    show_banner: false
    color_config: {
        
    }
    completions: {
        external: {
            enable: true
            completer: $external_completer
        }
    }
}
path add $"($env.HOME)/.local/bin";
path add $"/opt/homebrew/bin";


