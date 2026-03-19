static const char norm_fg[] = "#c3c3c7";
static const char norm_bg[] = "#0f1222";
static const char norm_border[] = "#5e6073";

static const char sel_fg[] = "#c3c3c7";
static const char sel_bg[] = "#634C5F";
static const char sel_border[] = "#c3c3c7";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
