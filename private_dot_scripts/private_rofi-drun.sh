#!/bin/sh
rofi -modi drun -drun-match-fields name,generic,categories,comment -drun-display-format "<b>{name}</b> [<span weight='light' size='small'><i>({generic})</i></span>] <span weight='light' size='small'>({categories})</span>" -show-icons -show drun
