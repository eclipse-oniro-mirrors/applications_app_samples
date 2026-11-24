/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// Deterministic transcription of the VPN control sample behaviour: config building,
// tunnel/protect/start/stop sequences, VPN id/destroy results and notification bookkeeping.
// The real vpnExtension, native udpConnect and notificationManager calls are replaced by
// explicit inputs so every branch has one reproducible result.

// Mirrors ComponentId.
export const START_VPN_BUTTON: string = 'START_VPN_BUTTON';
export const STOP_VPN_BUTTON: string = 'STOP_VPN_BUTTON';
export const CREATE_TUNNEL_BUTTON: string = 'CREATE_TUNNEL_BUTTON';
export const PROTECT_BUTTON: string = 'PROTECT_BUTTON';
export const SETUP_VPN_BUTTON: string = 'SETUP_VPN_BUTTON';
export const START_VPN_EXT_BUTTON: string = 'START_VPN_EXT_BUTTON';
export const INNER_STOP_VPN_BUTTON: string = 'INNER_STOP_VPN_BUTTON';
export const STOP_VPN_EXT_BUTTON: string = 'STOP_VPN_EXT_BUTTON';

// Mirrors the page/notification constants.
export const BUNDLE_NAME: string = 'com.samples.vpncontrol_case';
export const ABILITY_NAME: string = 'EntryAbility';
export const VPN_EXT_ABILITY: string = 'MyVpnExtAbility';
export const DEFAULT_SERVER_IP: string = '192.168.xxx.xxx';
export const DEFAULT_TUN_IP: string = '10.0.0.5';
export const DEFAULT_PREFIX: number = 24;
export const DEFAULT_BLOCKED_APP: string = 'com.example.baidumyapplication';
export const DEFAULT_MTU: number = 1400;
export const DEFAULT_DNS: string = '114.114.114.114';
export const START_TUNNEL_PORT: number = 8888;
export const EXT_TUNNEL_PORT: number = 1194;
export const TOAST_SHORT: number = 2000;
export const TOAST_LONG: number = 4000;
export const REQUEST_CODE: number = 0;
export const NOTIFICATION_TYPE_SIZE: number = 5;
export const NOTIFICATION_REQUEST_ID: number = 1;
export const NOTIFICATION_TITLE: string = 'VPN';
export const NOTIFICATION_TEXT: string = 'VPN is connected';
export const NOTIFICATION_ADDITIONAL: string = 'Tap to open VPN control';
export const NOTIFICATION_CLICK_TITLE: string = 'VPN connected';
export const NOTIFICATION_CLICK_TEXT: string = 'Return to the VPN control page';
export const STATUS_WAIT: string = 'wait';
export const STATUS_PASS: string = 'Pass';
export const STATUS_ERROR: string = 'Error';
export const FAMILY_IPV4: number = 1;
export const FAMILY_IPV6: number = 2;
export const ACTION_START_ABILITY: number = 0;
export const ACTION_SEND_COMMON_EVENT: number = 1;
export const SLOT_CONTENT_INFORMATION: number = 1;
export const PAGE_START_VPN: string = 'pages/StartVpn';
export const PAGE_STOP_VPN: string = 'pages/StopVpn';

// Mirrors the layout constants in Index/StartVpn/StopVpn.
export const TITLE_FONT_SIZE: number = 35;
export const BUTTON_FONT_SIZE: number = 25;
export const BUTTON_MARGIN: number = 16;
export const LABEL_FONT_SIZE: number = 20;
export const INPUT_MARGIN: number = 2;
export const BACK_ICON_SIZE: number = 12;
export const TITLE_BAR_HEIGHT: number = 56;
export const BACK_ICON_MARGIN: number = 24;

export function componentId(key: number): string {
  if (key === 0) { return START_VPN_BUTTON; }
  if (key === 1) { return STOP_VPN_BUTTON; }
  if (key === 2) { return CREATE_TUNNEL_BUTTON; }
  if (key === 3) { return PROTECT_BUTTON; }
  if (key === 4) { return SETUP_VPN_BUTTON; }
  if (key === 5) { return START_VPN_EXT_BUTTON; }
  if (key === 6) { return INNER_STOP_VPN_BUTTON; }
  if (key === 7) { return STOP_VPN_EXT_BUTTON; }
  return '';
}

export function isValidIPv4(ip: string): boolean {
  const parts: Array<string> = ip.split('.');
  if (parts.length !== 4) { return false; }
  for (let i: number = 0; i < parts.length; i++) {
    if (parts[i].length === 0) { return false; }
    const value: number = Number(parts[i]);
    if (!Number.isFinite(value) || value < 0 || value > 255) { return false; }
    if (parts[i].length > 1 && parts[i].charAt(0) === '0') { return false; }
  }
  return true;
}

export function prefixValid(prefix: number): boolean {
  return Number.isInteger(prefix) && prefix >= 0 && prefix <= 32;
}

export function mtuValid(mtu: number): boolean {
  return Number.isInteger(mtu) && mtu >= 68 && mtu <= 1500;
}

export function portValid(port: number): boolean {
  return Number.isInteger(port) && port >= 0 && port <= 65535;
}

export function familyName(family: number): string {
  if (family === FAMILY_IPV4) { return 'IPv4'; }
  if (family === FAMILY_IPV6) { return 'IPv6'; }
  return 'unknown';
}

export function networkValid(address: string, prefix: number, mtu: number, dns: string): boolean {
  return isValidIPv4(address) && prefixValid(prefix) && mtuValid(mtu) && isValidIPv4(dns);
}

export function vpnConfigSummary(tunIp: string, blockedApp: string, prefix: number, mtu: number,
  dns: string): string {
  return tunIp + '/' + prefix + '|' + mtu + '|' + dns + '|' + blockedApp;
}

export function routeSummary(iface: string, destination: string, destinationPrefix: number,
  gateway: string, hasGateway: boolean, isDefaultRoute: boolean): string {
  return iface + ':' + destination + '/' + destinationPrefix + ':' + gateway + ':' +
    hasGateway + ':' + isDefaultRoute;
}

export function addressCount(tunIp: string, prefix: number): number {
  return isValidIPv4(tunIp) && prefixValid(prefix) ? 1 : 0;
}

export function blockedAppCount(blockedApp: string): number {
  return blockedApp.length > 0 ? 1 : 0;
}

export function trustedAppCount(trusted: boolean): number {
  return trusted ? 1 : 0;
}

export function tunnelPortForPage(page: number): number {
  return page === 1 ? START_TUNNEL_PORT : EXT_TUNNEL_PORT;
}

// StartVpn checks `if (g_tunnelFd)` while the extension checks `fd < 0`.
export function tunnelCreatedForPage(fd: number): boolean {
  return fd !== 0;
}

export function tunnelCreatedForExtension(fd: number): boolean {
  return fd >= 0;
}

export function protectToast(ok: boolean): string {
  return ok ? 'vpn Protect Success' : 'vpn Protect Failed';
}

export function protectFlag(ok: boolean): string {
  return ok ? STATUS_PASS : STATUS_ERROR;
}

export function startToast(ok: boolean): string {
  return ok ? 'VPN started successfully' : 'VPN start failed';
}

export function createTunnelToast(ok: boolean): string {
  return ok ? 'CreateTunnel Success' : 'CreateTunnel Fail';
}

export function startExtToast(ok: boolean): string {
  return ok ? 'start vpnExt Success' : 'start vpnExt Fail';
}

export function stopExtToast(ok: boolean): string {
  return ok ? 'stop vpnExt Success' : 'stop vpnExt Fail';
}

export function destroyToast(ok: boolean): string {
  return ok ? 'vpn Destroy Success' : 'vpn Destroy Failed';
}

export function destroyFlag(ok: boolean): string {
  return ok ? STATUS_PASS : STATUS_ERROR;
}

export function routeUrl(page: number): string {
  return page === 1 ? PAGE_START_VPN : PAGE_STOP_VPN;
}

export function routeFlag(ok: boolean): string {
  return ok ? STATUS_PASS : STATUS_ERROR;
}

export function nextNotificationId(current: number): number {
  return current + 1;
}

export function notificationRequestId(): number {
  return NOTIFICATION_REQUEST_ID;
}

export function notificationSlotType(): number {
  return SLOT_CONTENT_INFORMATION;
}

export function notificationContentType(): number {
  return 0;
}

export function notificationGroup(group: string): string {
  return group.length > 0 ? group : '';
}

export function notificationTitle(clickable: boolean): string {
  return clickable ? NOTIFICATION_CLICK_TITLE : NOTIFICATION_TITLE;
}

export function notificationText(clickable: boolean): string {
  return clickable ? NOTIFICATION_CLICK_TEXT : NOTIFICATION_TEXT;
}

export function notificationAdditional(): string {
  return NOTIFICATION_ADDITIONAL;
}

export function wantAgentRequestCode(): number {
  return REQUEST_CODE;
}

export function wantAgentActionType(kind: number): number {
  return kind === 0 ? ACTION_START_ABILITY : ACTION_SEND_COMMON_EVENT;
}

export function wantAgentBundleName(): string {
  return BUNDLE_NAME;
}

export function wantAgentAbilityName(): string {
  return ABILITY_NAME;
}

export function vpnIdResult(current: string, generated: string): string {
  return generated.length > 0 ? generated : current;
}

export function destroyResult(destroyed: boolean, caught: boolean): boolean {
  return destroyed && !caught;
}

export function badgeAfterAdd(current: number): number {
  return current + 1;
}

export function badgeAfterSet(value: number): number {
  return value;
}

export function countsByTypeIncrement(counts: Array<number>, typeId: number): Array<number> {
  const next: Array<number> = counts.slice();
  if (typeId >= 0 && typeId < next.length) {
    next[typeId] = next[typeId] + 1;
  }
  return next;
}

export function badgeTotal(counts: Array<number>): number {
  let total: number = 0;
  for (let i: number = 0; i < counts.length; i++) { total += counts[i]; }
  return total;
}

export function notificationTypeCount(counts: Array<number>, typeId: number): number {
  if (typeId < 0 || typeId >= counts.length) { return 0; }
  return counts[typeId];
}

export function emptyNotificationCounts(): Array<number> {
  const counts: Array<number> = [];
  for (let i: number = 0; i <= NOTIFICATION_TYPE_SIZE; i++) { counts.push(0); }
  return counts;
}

export function notificationGroupsEmpty(): Array<number> {
  const groups: Array<number> = [];
  for (let i: number = 0; i <= NOTIFICATION_TYPE_SIZE; i++) { groups.push(0); }
  return groups;
}

// Mirrors the start/stop flow on StartVpn/StopVpn.
export class VpnFlowModel {
  private events: Array<string> = [];
  private tunnelFd: number = -1;
  private protectedOk: boolean = false;
  private vpnCreated: boolean = false;
  private vpnId: string = '';
  private flag: string = STATUS_WAIT;
  private toast: string = '';
  private notificationPublished: boolean = false;
  private destroyed: boolean = false;

  private record(step: string): void { this.events.push(step); }

  createTunnel(fd: number): boolean {
    this.tunnelFd = fd;
    const ok: boolean = tunnelCreatedForPage(fd);
    this.toast = createTunnelToast(ok);
    this.flag = ok ? STATUS_PASS : STATUS_ERROR;
    this.record('tunnel:' + fd);
    return ok;
  }

  protect(ok: boolean): string {
    this.protectedOk = ok;
    this.toast = protectToast(ok);
    this.flag = protectFlag(ok);
    this.record('protect:' + ok);
    return this.flag;
  }

  setupVpn(ok: boolean, generatedId: string): string {
    this.vpnCreated = ok;
    this.vpnId = vpnIdResult(this.vpnId, generatedId);
    this.toast = startToast(ok);
    this.flag = ok ? STATUS_PASS : STATUS_ERROR;
    this.record('setup:' + ok);
    return this.vpnId;
  }

  publishNotification(ok: boolean): boolean {
    this.notificationPublished = ok;
    this.record('notify:' + ok);
    return ok;
  }

  run(tunnelFd: number, protectOk: boolean, setupOk: boolean, notifyOk: boolean): string {
    this.record('run');
    if (!this.createTunnel(tunnelFd)) { return 'create-failed'; }
    this.protect(protectOk);
    if (!protectOk) { return 'protect-failed'; }
    this.setupVpn(setupOk, 'vpn-' + tunnelFd);
    if (!setupOk) { return 'setup-failed'; }
    this.publishNotification(notifyOk);
    return 'ok';
  }

  stop(destroyOk: boolean, stopFd: boolean): string {
    this.record('stop');
    if (!stopFd) { return 'stop-fd-skipped'; }
    this.destroyed = destroyOk;
    this.toast = destroyToast(destroyOk);
    this.flag = destroyFlag(destroyOk);
    this.record('destroy:' + destroyOk);
    return destroyOk ? 'destroyed' : 'destroy-failed';
  }

  eventsText(): string { return this.events.join(','); }
  eventCount(): number { return this.events.length; }
  fd(): number { return this.tunnelFd; }
  protectedValue(): boolean { return this.protectedOk; }
  created(): boolean { return this.vpnCreated; }
  id(): string { return this.vpnId; }
  state(): string { return this.flag; }
  message(): string { return this.toast; }
  notified(): boolean { return this.notificationPublished; }
  destroyedValue(): boolean { return this.destroyed; }
}

// Mirrors the MyVpnExtAbility lifecycle and ordering.
export class VpnExtensionModel {
  private events: Array<string> = [];

  private record(step: string): void { this.events.push(step); }

  private tunnelFd: number = -1;
  private protectedOk: boolean = false;
  private created: boolean = false;
  private contextValid: boolean = true;

  onCreate(contextValid: boolean): void {
    this.contextValid = contextValid;
    this.record('onCreate');
  }

  createTunnel(fd: number): boolean {
    this.tunnelFd = fd;
    const ok: boolean = tunnelCreatedForExtension(fd);
    this.record('createTunnel:' + ok);
    return ok;
  }

  protect(ok: boolean): void {
    this.protectedOk = ok;
    this.record('protect:' + ok);
  }

  setupVpn(ok: boolean): void {
    this.created = ok;
    this.record('setup:' + ok);
  }

  run(fd: number, protectOk: boolean, setupOk: boolean): string {
    if (!this.contextValid) { return 'no-context'; }
    if (!this.createTunnel(fd)) { return 'tunnel-failed'; }
    this.protect(protectOk);
    if (!protectOk) { return 'protect-failed'; }
    this.setupVpn(setupOk);
    return setupOk ? 'ok' : 'setup-failed';
  }

  onRequest(): void { this.record('onRequest'); }
  onConnect(): void { this.record('onConnect'); }
  onDisconnect(): void { this.record('onDisconnect'); }
  onDestroy(destroyOk: boolean): void {
    this.record('onDestroy');
    this.destroyedOk = destroyOk;
  }

  private destroyedOk: boolean = false;

  eventsText(): string { return this.events.join(','); }
  eventCount(): number { return this.events.length; }
  fd(): number { return this.tunnelFd; }
  protectedValue(): boolean { return this.protectedOk; }
  createdValue(): boolean { return this.created; }
  destroyOk(): boolean { return this.destroyedOk; }
}

// Mirrors notification id allocation, grouping and management counters.
export class NotificationModel {
  private id: number = 0;
  private badge: number = 0;
  private counts: Array<number> = emptyNotificationCounts();
  private groups: Array<number> = notificationGroupsEmpty();
  private publishedCount: number = 0;
  private cancelledCount: number = 0;

  publish(typeId: number, group: string): number {
    const allocated: number = this.id;
    this.id = nextNotificationId(this.id);
    if (typeId >= 0 && typeId < this.counts.length) {
      this.counts[typeId] = this.counts[typeId] + 1;
      this.groups[typeId] = this.groups[typeId] + 1;
    }
    this.badge = badgeAfterAdd(this.badge);
    this.publishedCount++;
    return allocated;
  }

  addWithoutPublish(typeId: number): void {
    if (typeId >= 0 && typeId < this.counts.length) {
      this.counts[typeId] = this.counts[typeId] + 1;
    }
    this.badge = badgeAfterAdd(this.badge);
  }

  cancel(typeId: number): void {
    if (typeId >= 0 && typeId < this.counts.length && this.counts[typeId] > 0) {
      this.counts[typeId] = this.counts[typeId] - 1;
      this.cancelledCount++;
    }
  }

  cancelAll(): void {
    this.cancelledCount += this.badge;
    this.counts = emptyNotificationCounts();
    this.badge = 0;
  }

  setBadge(value: number): void {
    this.badge = badgeAfterSet(value);
  }

  nextId(): number { return this.id; }
  badgeValue(): number { return this.badge; }
  total(): number { return badgeTotal(this.counts); }
  countOf(typeId: number): number { return notificationTypeCount(this.counts, typeId); }
  published(): number { return this.publishedCount; }
  cancelled(): number { return this.cancelledCount; }
  countsText(): string { return this.counts.join(','); }
}

// Mirrors Index/StartVpn/StopVpn router and flag transitions.
export class PageRouteModel {
  private flag: string = STATUS_WAIT;
  private route: string = '';

  push(page: number, ok: boolean): string {
    this.route = routeUrl(page);
    this.flag = routeFlag(ok);
    return this.flag;
  }

  back(): string {
    this.route = '';
    return this.route;
  }

  state(): string { return this.flag; }
  currentRoute(): string { return this.route; }
}

// Mirrors the getVpnId/destroy test helpers.
export class VpnTestModel {
  private vpnId: string = '';

  getVpnId(generated: string): string {
    this.vpnId = vpnIdResult(this.vpnId, generated);
    return this.vpnId;
  }

  destroy(destroyed: boolean, caught: boolean): boolean {
    return destroyResult(destroyed, caught);
  }

  id(): string { return this.vpnId; }
}
