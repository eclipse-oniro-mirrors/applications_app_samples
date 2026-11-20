const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const cp = require('child_process');
const root = __dirname;
const original = 'D:/git/xy/applications_app_samples/code/' + root.replace(/\\/g, '/').split('/new/')[1];
const out = path.join(root, '.validation');
fs.mkdirSync(out, { recursive: true });
const auditPath = path.join(out, 'audit.json');
const audit = fs.existsSync(auditPath) ? JSON.parse(fs.readFileSync(auditPath, 'utf8')) : { project: root, original, inheritedConsecutiveFailures: 0, consecutiveFailures: 0, builds: [], deviceExecuted: false };
if (audit.consecutiveFailures >= 5) throw Error('Stopped after five consecutive failures');
const target = process.argv[2];
if (!['default', 'ohosTest'].includes(target)) throw Error('Specify default or ohosTest');
function sources(dir, relative = '') {
  const result = [];
  for (const name of fs.readdirSync(dir)) {
    if (['.validation', 'oh_modules', 'node_modules', '.hvigor', 'build', '.git'].includes(name)) continue;
    const rel = path.join(relative, name);
    const file = path.join(dir, name);
    if (fs.statSync(file).isDirectory()) result.push(...sources(file, rel));
    else if (/\.(ets|ts|cpp|c|h|json5|json|properties|txt)$/.test(name)) result.push(rel);
  }
  return result;
}
const hash = file => crypto.createHash('sha256').update(fs.readFileSync(file)).digest('hex');
const n = audit.builds.length + 1;
const id = String(n).padStart(3, '0');
const snapshot = path.join(out, 'snapshots', id);
const before = {};
for (const rel of sources(root)) {
  before[rel] = hash(path.join(root, rel));
  fs.mkdirSync(path.dirname(path.join(snapshot, rel)), { recursive: true });
  fs.copyFileSync(path.join(root, rel), path.join(snapshot, rel));
}
const node = 'D:/Program Files/Huawei/DevEco Studio/tools/node/node.exe';
const hvigor = 'D:/Program Files/Huawei/DevEco Studio/tools/hvigor/bin/hvigorw.js';
const args = [hvigor, '--mode', 'module', '-p', `module=entry@${target}`, '-p', 'product=default', '-p', 'buildMode=debug', 'assembleHap', '--no-daemon'];
const logPath = path.join(out, `build-${id}-${target}.log`);
const log = fs.openSync(logPath, 'w');
const start = new Date().toISOString();
const result = cp.spawnSync(node, args, { cwd: root, env: { ...process.env, DEVECO_SDK_HOME: 'E:/sdk', OHOS_SDK_HOME: 'E:/sdk', PATH: path.dirname(node) + path.delimiter + process.env.PATH }, stdio: ['ignore', log, log], timeout: 240000 });
fs.closeSync(log);
const missing = [];
const changed = [];
for (const rel of Object.keys(before)) {
  const file = path.join(root, rel);
  if (!fs.existsSync(file)) {
    missing.push(rel);
    const baseline = path.join(original, rel);
    fs.mkdirSync(path.dirname(file), { recursive: true });
    // Missing only: never overwrite modifications. Prefer the protected new source.
    if (fs.existsSync(baseline)) fs.copyFileSync(baseline, path.join(snapshot, rel + '.original'));
    fs.copyFileSync(path.join(snapshot, rel), file);
  }
  if (hash(file) !== before[rel]) changed.push(rel);
}
const success = result.status === 0 && !result.error && missing.length === 0 && changed.length === 0;
audit.consecutiveFailures = success ? 0 : audit.consecutiveFailures + 1;
audit.builds.push({ n, target, start, end: new Date().toISOString(), command: [node, ...args], exit: result.status, error: result.error?.message, success, logPath, sourceCount: Object.keys(before).length, before, missingRestored: missing, changed });
fs.writeFileSync(auditPath, JSON.stringify(audit, null, 2));
console.log(JSON.stringify({ n, target, success, exit: result.status, consecutiveFailures: audit.consecutiveFailures, missing, changed, logPath }));
process.exitCode = success ? 0 : 1;
