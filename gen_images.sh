#!/bin/bash
set -e
cd /tmp/waldorf-50/images
export GEMINI_API_KEY="AIzaSyBvWmjPRWi1MARtpSp_Hmx1bU0jRGNbRBw"
STYLE="Playful indie illustration style with bold black outlines, flat bright colors, and quirky cartoon characters. White background. Fun, irreverent, hand-drawn feel with thick wobbly outlines and flat color fills like a zine or indie comic. Vertical portrait composition, like a book page. No text, no words, no labels anywhere in the image."
GEN="/home/alex/.nvm/versions/node/v22.22.0/lib/node_modules/openclaw/skills/nano-banana-pro/scripts/generate_image.py"

declare -A IMAGES
IMAGES[32_pink.png]="A cartoon parent at a toy store having an intense emotional reaction — hand over heart, recoiling — at a shelf of bright pink plastic toys. Meanwhile their child is magnetically drawn toward the pink aisle, arms outstretched. The parent is steering them toward the muted earth-tone wooden toy section."
IMAGES[33_circle_time.png]="A group of adults standing in a circle holding hands in a meadow, some looking uncomfortable, some transcendently happy. One newcomer parent looks horrified but is trapped between two very committed circle-holders who won't let go."
IMAGES[34_same_drawing.png]="A wall covered with dozens of identical children's drawings — all the same rainbow/house/sun. The Waldorf teacher points at them enthusiastically, clearly seeing profound developmental meaning. The parent squints, trying to see the difference."
IMAGES[35_knitting.png]="A parent who clearly never knitted before, tangled in yarn, needles sticking out everywhere, a barely recognizable lump of knitting in their lap. Around them, other Waldorf parents knit effortlessly and beautifully. A ball of yarn wraps around the struggling parent like a cocoon."
IMAGES[37_compost.png]="A cartoon compost bin in the garden with a little nameplate collar like a pet. The parent is feeding it lovingly with kitchen scraps. The compost bin has cartoon eyes and looks happy. Worms peek out smiling. The family dog watches jealously."
IMAGES[38_rain_walk.png]="A family trudging through heavy rain in full rain gear, mud everywhere, the children soaked and miserable. The parent marches ahead joyfully with arms spread wide embracing the storm. Puddles are knee-deep. A duck looks at them like they are crazy."
IMAGES[39_advent_spiral.png]="Two families advent spirals side by side. One is a modest attempt with some evergreen branches. The other is an absolutely magnificent spiral with perfect moss, crystals, candles, and golden stars — clearly hours of work. The overachiever parent pretends it was thrown together."
IMAGES[40_shoes.png]="A tiny pair of beautiful handmade leather children's shoes on a shelf, glowing like precious artifacts, with a price tag showing a huge number. Below them, the parent's own shoes are battered, falling apart, held together with tape. The parent looks down at their feet and shrugs."
IMAGES[42_recorder.png]="A child enthusiastically playing a wooden recorder with musical notes shown as visible chaotic squiggles blasting out. The parent sits nearby with hands over ears, eyes squeezed shut, enduring the noise. A cat flees. A glass on the table is cracking from the sound."
IMAGES[43_normal_lunch.png]="A child looking longingly at another kid's lunchbox containing fun packaged snacks and a juice box. Their own Waldorf lunchbox has beautiful but boring items — carrot sticks, sourdough, an apple. The parent is artfully changing the subject, pointing at a butterfly."
IMAGES[44_gnome_family.png]="A family portrait on the mantle — but it includes several felt gnomes positioned as actual family members alongside the humans. The gnomes have their own tiny chairs at the dinner table. One gnome is tucked into a tiny bed. The family treats this as completely normal."
IMAGES[45_became_waldorf.png]="A split image — left side: a younger version of the parent in normal clothes, rolling their eyes and laughing at someone carrying felt gnomes and wearing linen. Right side: the same parent now, wearing linen, carrying felt gnomes, surrounded by beeswax, looking exactly like the person they judged. Full circle."
IMAGES[47_fairy_friend.png]="A child talking to thin air in a garden, clearly conversing with an imaginary fairy friend shown as a faint sparkly outline. The parent watches from behind a tree, hand on heart, tears of joy, absolutely beaming. Another parent nearby whose kid's imaginary friend is a cartoon character looks ashamed."
IMAGES[48_volunteer.png]="A parent who clearly just volunteered once — now buried under responsibilities: carrying event boxes, wearing multiple committee badges, holding meeting agendas, answering three phones, while other parents tiptoe past avoiding eye contact."
IMAGES[49_crafting.png]="A home where every single surface — kitchen table, couch, floor, countertops, bed — has some craft project on it: wet felting, watercolor paintings drying, wool roving, beeswax, knitting projects. There is literally nowhere to sit. The parent eats dinner standing up."
IMAGES[50_no_regrets.png]="A cartoon parent standing on top of a hill at golden hour, cape flowing made of silk scarves, holding a gnome like a trophy, surrounded by everything Waldorf — wooden toys, beeswax candles, fermentation jars, a lyre, knitting needles. They look triumphant but slightly exhausted. A single tear of joy or exhaustion rolls down their cheek."

for fname in $(echo "${!IMAGES[@]}" | tr ' ' '\n' | sort); do
  if [ -f "$fname" ]; then
    echo "SKIP $fname (exists)"
    continue
  fi
  echo "GENERATING $fname..."
  uv run "$GEN" --prompt "$STYLE ${IMAGES[$fname]}" --filename "$fname" --resolution 1K
  echo "DONE $fname"
done
echo "ALL_DONE"
