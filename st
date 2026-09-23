<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>StudioLift — Your everyday photo, elevated.</title>
<style>
  @import url('https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Manrope:wght@400;600;700;800&display=swap');

  :root {
    --bg: #f5f4f0;
    --surface: #fff;
    --ink: #252b25;
    --muted: #7b8179;
    --line: #e6e8e1;
    --green: #344c37;
    --lime: #e6efb2;
  }

  * { box-sizing: border-box; }
  body {
    margin: 0;
    background: var(--bg);
    color: var(--ink);
    font-family: "DM Sans", system-ui, sans-serif;
  }
  button, select, input { font: inherit; }
  button, select { cursor: pointer; }
  button { transition: background .18s, transform .18s; }
  button:active { transform: translateY(1px); }
  button:focus-visible, select:focus-visible, input:focus-visible {
    outline: 3px solid #a4bd78;
    outline-offset: 3px;
  }

  header {
    height: 82px;
    padding: 0 5%;
    background: #ffffffb8;
    border-bottom: 1px solid var(--line);
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 16px;
  }
  .brand {
    display: flex;
    align-items: center;
    gap: 11px;
    font-family: Manrope, sans-serif;
    font-size: 23px;
    font-weight: 800;
    letter-spacing: -1px;
  }
  .mark {
    width: 35px;
    height: 35px;
    display: grid;
    place-items: center;
    border-radius: 11px;
    color: var(--lime);
    background: var(--green);
    font-size: 24px;
  }
  .privacy { color: var(--muted); font-size: 12px; }
  .privacy span { color: #648456; margin-right: 6px; }
  main { max-width: 1440px; padding: 38px 5% 24px; margin: auto; }
  .intro {
    display: flex;
    align-items: end;
    justify-content: space-between;
    gap: 20px;
    margin-bottom: 28px;
  }
  .eyebrow {
    color: #6c7b55;
    text-transform: uppercase;
    letter-spacing: 2px;
    font-size: 10px;
    font-weight: 700;
    margin-bottom: 10px;
  }
  h1 {
    margin: 0 0 10px;
    font-family: Manrope, sans-serif;
    font-size: clamp(28px, 3vw, 42px);
    font-weight: 600;
    letter-spacing: -1.8px;
  }
  .intro p { color: var(--muted); font-size: 14px; margin: 0; }
  .pill {
    flex-shrink: 0;
    font-size: 11px;
    padding: 9px 13px;
    border: 1px solid #dce2ce;
    border-radius: 30px;
    color: #657345;
    background: #eef1e5;
  }

  .workspace {
    display: grid;
    grid-template-columns: minmax(0, 1fr) 326px;
    border: 1px solid var(--line);
    border-radius: 20px;
    overflow: hidden;
    background: white;
    box-shadow: 0 12px 48px #27372506;
  }
  .editor { min-width: 0; display: flex; flex-direction: column; }
  .toolbar {
    min-height: 66px;
    padding: 14px 22px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    border-bottom: 1px solid var(--line);
  }
  .file-info { min-width: 0; }
  .file-info strong {
    display: block;
    font-size: 12px;
    max-width: 270px;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
  }
  .file-info small { font-size: 10px; color: var(--muted); }
  .text-btn {
    background: white;
    border: 1px solid var(--line);
    border-radius: 8px;
    padding: 8px 11px;
    font-size: 11px;
    color: #52604f;
    white-space: nowrap;
  }
  .stage {
    min-height: 490px;
    height: 570px;
    position: relative;
    padding: 30px;
    display: grid;
    place-items: center;
    overflow: hidden;
    background-color: #ebece6;
    background-image: radial-gradient(#c9cec2 0.7px, transparent 0.7px);
    background-size: 12px 12px;
  }
  .stage.dragging { outline: 3px dashed #718b53; outline-offset: -12px; }
  canvas {
    max-width: 100%;
    max-height: 100%;
    width: auto;
    height: auto;
    object-fit: contain;
    box-shadow: 0 12px 35px #23311b21;
    display: none;
  }
  .empty { text-align: center; max-width: 370px; }
  .empty-art {
    width: 152px;
    height: 126px;
    margin: 0 auto 32px;
    position: relative;
  }
  .photo-card {
    position: absolute;
    inset: 4px 9px;
    border: 7px solid white;
    border-radius: 10px;
    background: #cad3b6;
    box-shadow: 0 8px 20px #344c3715;
    transform: rotate(-10deg);
    overflow: hidden;
  }
  .photo-card.front {
    background: linear-gradient(145deg, #f1e9d5, #b2bf93);
    transform: rotate(8deg) translate(15px, 8px);
  }
  .vase {
    position: absolute;
    left: 43px;
    top: 35px;
    width: 41px;
    height: 64px;
    border-radius: 9px 9px 20px 20px;
    background: linear-gradient(90deg, #c1916d, #eed3ad 55%, #c79974);
    box-shadow: 10px 12px 13px #5e694a33;
  }
  .vase::before {
    content: "";
    position: absolute;
    width: 14px;
    height: 25px;
    background: #d9b38d;
    top: -18px;
    left: 13px;
    border-radius: 4px 4px 0 0;
  }
  .sparkle {
    position: absolute;
    right: -10px;
    top: -8px;
    font-size: 38px;
    color: #667c45;
  }
  .empty h2 {
    font-family: Manrope, sans-serif;
    font-size: 21px;
    letter-spacing: -.7px;
    margin: 0 0 10px;
  }
  .empty p { color: #7b8175; font-size: 12px; line-height: 1.8; }
  .primary {
    border: 0;
    color: white;
    background: var(--green);
    padding: 13px 20px;
    border-radius: 10px;
    font-size: 12px;
    font-weight: 600;
  }
  .primary:hover { background: #456247; }
  .primary:disabled { opacity: .45; cursor: not-allowed; }
  .empty .primary { margin-top: 9px; }
  .empty .formats { font-size: 10px; margin-top: 14px; }
  .preview-footer {
    padding: 13px 22px;
    min-height: 51px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 12px;
    font-size: 10px;
    color: var(--muted);
  }
  #compare { touch-action: none; user-select: none; }
  #compare:disabled { opacity: .4; cursor: default; }

  aside { border-left: 1px solid var(--line); padding: 23px; }
  .section { margin-bottom: 23px; }
  .section-title {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 12px;
    font-size: 12px;
    font-weight: 700;
  }
  .section-title small {
    font-size: 9px;
    font-weight: 500;
    color: var(--muted);
  }
  .presets { display: grid; grid-template-columns: repeat(3, 1fr); gap: 8px; }
  .preset {
    padding: 6px 5px 8px;
    background: white;
    border: 1px solid var(--line);
    border-radius: 10px;
    font-size: 10px;
    color: #65705d;
  }
  .preset.active {
    border-color: #7b915a;
    box-shadow: 0 0 0 1px #7b915a;
    background: #f7f9f0;
    color: #344c37;
  }
  .swatch {
    height: 48px;
    margin-bottom: 7px;
    border-radius: 6px;
    display: grid;
    place-items: center;
    overflow: hidden;
  }
  .swatch::after {
    content: "";
    width: 21px;
    height: 32px;
    border-radius: 6px 6px 9px 9px;
    background: linear-gradient(90deg, #b5a58f, #f0e4d1, #c5b6a1);
    box-shadow: 8px 7px 10px #0002;
  }
  .clean { background: linear-gradient(135deg, #f5f5f0, #d5ddcc); }
  .warm { background: linear-gradient(135deg, #f4e8d7, #d6b98f); }
  .bold { background: linear-gradient(135deg, #889681, #354733); }

  select {
    width: 100%;
    padding: 10px;
    border: 1px solid var(--line);
    border-radius: 8px;
    background: #fafbf8;
    color: #4c5547;
    font-size: 11px;
  }
  .row { display: flex; gap: 8px; }
  .row > * { min-width: 0; flex: 1; }
  .control { margin-bottom: 14px; }
  .control label {
    display: flex;
    justify-content: space-between;
    font-size: 11px;
    color: #697160;
    margin-bottom: 6px;
  }
  output { font-size: 10px; font-variant-numeric: tabular-nums; }
  input[type=range] {
    display: block;
    width: 100%;
    height: 4px;
    accent-color: #526b3e;
    cursor: pointer;
  }
  .reset {
    border: 0;
    background: none;
    color: #7c876d;
    padding: 0;
    font-size: 10px;
  }
  .export-box { border-top: 1px solid var(--line); padding-top: 18px; }
  #download { width: 100%; }
  .export-note { text-align: center; font-size: 9px; color: var(--muted); margin: 9px 0 0; }
  .bottom-note {
    display: flex;
    justify-content: space-between;
    gap: 16px;
    color: #8a8e82;
    font-size: 10px;
    padding: 17px 2px;
  }
  #message { color: #65744e; }
  @media(max-width: 850px) {
    .workspace { grid-template-columns: 1fr; }
    aside { border-left: 0; border-top: 1px solid var(--line); }
    .stage { height: 460px; min-height: 340px; }
    .intro .pill { display: none; }
    header { height: 68px; }
    main { padding-top: 27px; }
  }
  @media(max-width: 450px) {
    .privacy { font-size: 9px; }
    .stage { padding: 18px; height: 390px; }
    .toolbar { padding: 12px; }
    .file-info strong { max-width: 160px; }
    .bottom-note { flex-direction: column; gap: 5px; }
  }
</style>
</head>
<body>
<header>
  <div class="brand"><span class="mark">✳</span> studiolift</div>
  <div class="privacy"><span>●</span> Local editing. Your photos stay yours.</div>
</header>

<main>
  <div class="intro">
    <div>
      <div class="eyebrow">A little light. A big difference.</div>
      <h1>Everyday photos. Studio energy.</h1>
      <p>Find your light, refine the details, and make it ready to share.</p>
    </div>
    <div class="pill">✧ Your pocket-sized photo studio</div>
  </div>

  <div class="workspace">
    <section class="editor" aria-label="Photo preview">
      <div class="toolbar">
        <div class="file-info">
          <strong id="filename">Your next great image starts here</strong>
          <small id="filemeta">Upload a photo to begin</small>
        </div>
        <button class="text-btn" id="replace">＋ Add photo</button>
      </div>

      <div class="stage" id="stage">
        <div class="empty" id="empty">
          <div class="empty-art" aria-hidden="true">
            <div class="photo-card"></div>
            <div class="photo-card front"><div class="vase"></div></div>
            <div class="sparkle">✧</div>
          </div>
          <h2>Give your photo a fresh start.</h2>
          <p>Drop an image here and bring out its best.<br>
             Better light. Balanced color. Beautifully yours.</p>
          <button class="primary" id="upload">↥ &nbsp; Upload a photo</button>
          <div class="formats">JPG, PNG or WebP · up to 25 MB</div>
        </div>
        <canvas id="canvas" aria-label="Enhanced photo preview"></canvas>
      </div>

      <div class="preview-footer">
        <span id="status" role="status" aria-live="polite">✧ Ready when you are</span>
        <button class="text-btn" id="compare" disabled>Hold to see original</button>
      </div>
    </section>

    <aside aria-label="Editing tools">
      <div class="section">
        <div class="section-title">01 &nbsp; Choose your look <small>ONE-CLICK PRESETS</small></div>
        <div class="presets">
          <button class="preset active" data-preset="clean" aria-pressed="true">
            <span class="swatch clean"></span>Clean studio
          </button>
          <button class="preset" data-preset="warm" aria-pressed="false">
            <span class="swatch warm"></span>Warm editorial
          </button>
          <button class="preset" data-preset="bold" aria-pressed="false">
            <span class="swatch bold"></span>Bold & crisp
          </button>
        </div>
      </div>

      <div class="section">
        <div class="section-title">02 &nbsp; Frame it</div>
        <select id="ratio" aria-label="Output aspect ratio">
          <option value="original">Original proportions</option>
          <option value="1">Square · 1:1</option>
          <option value="0.8">Social portrait · 4:5</option>
          <option value="0.5625">Story / Reel · 9:16</option>
          <option value="1.7777778">Website banner · 16:9</option>
        </select>
        <div class="row" style="margin-top:8px">
          <select id="fit" aria-label="Photo framing">
            <option value="cover">Fill frame / crop</option>
            <option value="contain">Fit whole photo</option>
          </select>
          <select id="backdrop" aria-label="Padding background">
            <option value="blur">Soft backdrop</option>
            <option value="#ffffff">White backdrop</option>
            <option value="#eee8dc">Warm backdrop</option>
            <option value="#263129">Dark backdrop</option>
          </select>
        </div>
        <p style="font-size:9px;color:var(--muted);line-height:1.5;margin:8px 0 0">
          Backdrops fill empty space in “Fit whole photo” mode.
        </p>
      </div>

      <div class="section">
        <div class="section-title">
          03 &nbsp; Make it yours
          <button class="reset" id="reset">Reset adjustments</button>
        </div>
        <div id="sliders"></div>
      </div>

      <div class="export-box">
        <button class="primary" id="download" disabled>Download image &nbsp; ↧</button>
        <p class="export-note">PNG export · up to 2000 px · no watermark</p>
      </div>
    </aside>
  </div>

  <div class="bottom-note">
    <span>Made for product pages, personal brands, and everything you share.</span>
    <span id="message" role="status" aria-live="polite">No account. No uploads. Just your creativity.</span>
  </div>
</main>

<input type="file" id="file" accept="image/jpeg,image/png,image/webp" hidden>

<script>
(() => {
  const $ = (id) => document.getElementById(id);
  const canvas = $("canvas");
  const ctx = canvas.getContext("2d");
  const source = document.createElement("canvas");
  const sourceCtx = source.getContext("2d", { willReadFrequently: true });
  const enhanced = document.createElement("canvas");
  const enhancedCtx = enhanced.getContext("2d");

  let originalPixels = null;
  let loaded = false;
  let comparing = false;
  let timer;
  let fileBase = "photo";
  let fileInput = $("file");

  const definitions = [
    ["exposure", "Exposure", -50, 50],
    ["contrast", "Contrast", -40, 60],
    ["shadows", "Shadow lift", 0, 70],
    ["saturation", "Vibrance", -60, 60],
    ["warmth", "Warmth", -40, 40],
    ["sharpness", "Detail", 0, 70]
  ];

  const presets = {
    clean: { exposure: 8, contrast: 8, shadows: 18, saturation: 5, warmth: 0, sharpness: 20 },
    warm:  { exposure: 6, contrast: 5, shadows: 22, saturation: -5, warmth: 17, sharpness: 10 },
    bold:  { exposure: 2, contrast: 24, shadows: 8, saturation: 16, warmth: -3, sharpness: 38 }
  };

  function setCanvasVisibility() {
    const empty = $("empty");
    if (!loaded) {
      canvas.style.display = "none";
      empty.style.display = "block";
      return;
    }
    empty.style.display = "none";
    canvas.style.display = "block";
  }

  function bindSliderEvents() {
    for (const [id, label, min, max] of definitions) {
      const div = document.createElement("div");
      div.className = "control";
      div.innerHTML = `
        <label for="${id}">${label}<output id="${id}Value" for="${id}">0</output></label>
        <input type="range" id="${id}" min="${min}" max="${max}" value="0">
      `;
      $("sliders").appendChild(div);

      const input = $(id);
      input.addEventListener("input", () => {
        $(id + "Value").value = input.value;
        document.querySelectorAll(".preset").forEach((b) => {
          b.classList.remove("active");
          b.setAttribute("aria-pressed", "false");
        });
        scheduleEnhance();
      });
    }
  }

  function setValues(values) {
    definitions.forEach(([id]) => {
      const input = $(id);
      const output = $(id + "Value");
      const next = Number(values[id] ?? 0);
      input.value = next;
      output.value = next;
    });
  }

  function applyPreset(name) {
    setValues(presets[name]);
    document.querySelectorAll(".preset").forEach((b) => {
      const active = b.dataset.preset === name;
      b.classList.toggle("active", active);
      b.setAttribute("aria-pressed", String(active));
    });
    scheduleEnhance();
  }

  document.querySelectorAll(".preset").forEach((button) => {
    button.addEventListener("click", () => applyPreset(button.dataset.preset));
  });

  $("reset").addEventListener("click", () => {
    setValues({});
    document.querySelectorAll(".preset").forEach((b) => {
      b.classList.remove("active");
      b.setAttribute("aria-pressed", "false");
    });
    scheduleEnhance();
  });

  function scheduleEnhance() {
    if (!loaded) return;
    clearTimeout(timer);
    $("status").textContent = "Refining your image…";
    timer = setTimeout(() => {
      enhance();
      render();
    }, 90);
  }

  function enhance() {
    if (!originalPixels) return;
    const values = Object.fromEntries(
      definitions.map(([id]) => [id, Number($(id).value)])
    );

    const pixels = new ImageData(
      new Uint8ClampedArray(originalPixels.data),
      source.width,
      source.height
    );
    const d = pixels.data;

    const exposure = Math.pow(2, values.exposure / 60);
    const contrast = 1 + values.contrast / 100;
    const saturation = 1 + values.saturation / 100;
    const lift = values.shadows / 100;
    const warm = values.warmth * 0.55;

    for (let i = 0; i < d.length; i += 4) {
      const luminance = (.2126 * d[i] + .7152 * d[i + 1] + .0722 * d[i + 2]) / 255;
      const shadow = lift * 65 * Math.pow(1 - luminance, 2);

      let r = (d[i] * exposure + shadow - 128) * contrast + 128 + warm;
      let g = (d[i + 1] * exposure + shadow - 128) * contrast + 128 + warm * 0.12;
      let b = (d[i + 2] * exposure + shadow - 128) * contrast + 128 - warm;

      const gray = .2126 * r + .7152 * g + .0722 * b;
      d[i] = gray + (r - gray) * saturation;
      d[i + 1] = gray + (g - gray) * saturation;
      d[i + 2] = gray + (b - gray) * saturation;
    }

    if (values.sharpness > 0) {
      const copy = new Uint8ClampedArray(d);
      const w = source.width;
      const h = source.height;
      const amount = values.sharpness / 170;

      for (let y = 1; y < h - 1; y++) {
        for (let x = 1; x < w - 1; x++) {
          const i = (y * w + x) * 4;
          if (
            copy[i + 3] < 255 ||
            copy[i - 4 + 3] < 255 || copy[i + 4 + 3] < 255 ||
            copy[i - w * 4 + 3] < 255 || copy[i + w * 4 + 3] < 255
          ) continue;

          for (let c = 0; c < 3; c++) {
            const center = copy[i + c];
            const average =
              (copy[i - 4 + c] + copy[i + 4 + c] +
               copy[i - w * 4 + c] + copy[i + w * 4 + c]) / 4;
            d[i + c] = center + (center - average) * amount;
          }
        }
      }
    }

    enhanced.width = source.width;
    enhanced.height = source.height;
    enhancedCtx.putImageData(pixels, 0, 0);
  }

  function drawImageFit(image, cover, overscan = 1) {
    const scale = (cover
      ? Math.max(canvas.width / image.width, canvas.height / image.height)
      : Math.min(canvas.width / image.width, canvas.height / image.height)
    ) * overscan;

    const w = image.width * scale;
    const h = image.height * scale;

    ctx.drawImage(image, (canvas.width - w) / 2, (canvas.height - h) / 2, w, h);
  }

  function render() {
    if (!loaded) return;
    const ratio = $("ratio").value === "original"
      ? source.width / source.height
      : Number($("ratio").value);

    const edge = Math.min(2000, Math.max(source.width, source.height));
    canvas.width = Math.max(1, Math.round(ratio >= 1 ? edge : edge * ratio));
    canvas.height = Math.max(1, Math.round(ratio >= 1 ? edge / ratio : edge));
    ctx.imageSmoothingEnabled = true;
    ctx.imageSmoothingQuality = "high";

    const image = comparing ? source : enhanced;
    const backdrop = $("backdrop").value;

    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.fillStyle = backdrop === "blur" ? "#eeeae2" : backdrop;
    ctx.fillRect(0, 0, canvas.width, canvas.height);

    if ($("fit").value === "contain" && backdrop === "blur") {
      ctx.save();
      ctx.filter = `blur(${