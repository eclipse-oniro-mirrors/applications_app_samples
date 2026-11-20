/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

const RTL_LANGS = ['ar', 'he', 'fa', 'ur'];
const ROUTE_ALLOWED = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/_-';
const ROUTE_MAX_LENGTH = 64;

function breakpointOf(width) {
  if (width < 600) {
    return 'sm';
  }
  if (width < 840) {
    return 'md';
  }
  return 'lg';
}

function columnsOf(breakpoint) {
  if (breakpoint === 'sm') {
    return 2;
  }
  if (breakpoint === 'md') {
    return 3;
  }
  return 4;
}

function gutterOf(width) {
  return width < 600 ? 12 : 24;
}

function marginOf(width) {
  return width < 600 ? 16 : 32;
}

function fontScaleOf(breakpoint) {
  if (breakpoint === 'sm') {
    return 1.0;
  }
  if (breakpoint === 'md') {
    return 1.1;
  }
  return 1.2;
}

function contentWidthOf(width) {
  return width - 2 * marginOf(width);
}

function columnsForWidth(width) {
  return columnsOf(breakpointOf(width));
}

function itemWidthOf(width) {
  const columns = columnsForWidth(width);
  const gutter = gutterOf(width);
  const content = contentWidthOf(width);
  return Math.floor((content - (columns - 1) * gutter) / columns);
}

function aspectHeightOf(width, numerator, denominator) {
  const twice = width * denominator * 2;
  return Math.floor((twice + numerator) / (2 * numerator));
}

function partition(total, parts) {
  const base = Math.floor(total / parts);
  const extra = total % parts;
  const result = [];
  for (let i = 0; i < parts; i++) {
    result.push(i < extra ? base + 1 : base);
  }
  return result;
}

function offsetOf(sizes, index) {
  let sum = 0;
  for (let i = 0; i < index; i++) {
    sum += sizes[i];
  }
  return sum;
}

function spanSum(spans) {
  let sum = 0;
  for (let i = 0; i < spans.length; i++) {
    sum += spans[i];
  }
  return sum;
}

function isValidSpan(spans, total) {
  if (spans.length === 0) {
    return false;
  }
  for (let i = 0; i < spans.length; i++) {
    const value = spans[i];
    if (value % 1 !== 0 || value <= 0) {
      return false;
    }
  }
  return spanSum(spans) === total;
}

function langOf(tag) {
  const parts = tag.split('-');
  return parts[0].toLowerCase();
}

function isRtl(lang) {
  return RTL_LANGS.indexOf(lang.toLowerCase()) >= 0;
}

function densityBucket(dpi) {
  if (dpi <= 120) {
    return 'ldpi';
  }
  if (dpi <= 160) {
    return 'mdpi';
  }
  if (dpi <= 240) {
    return 'hdpi';
  }
  if (dpi <= 320) {
    return 'xhdpi';
  }
  if (dpi <= 480) {
    return 'xxhdpi';
  }
  return 'xxxhdpi';
}

function qualifierOf(tag, dpi) {
  return langOf(tag) + '-' + densityBucket(dpi);
}

function routeKeyOf(page) {
  return 'app.string.' + page;
}

function sanitizeRoute(id) {
  let result = '';
  for (let i = 0; i < id.length; i++) {
    const ch = id.charAt(i);
    if (ROUTE_ALLOWED.indexOf(ch) >= 0) {
      result += ch;
    }
  }
  if (result.length > ROUTE_MAX_LENGTH) {
    result = result.substring(0, ROUTE_MAX_LENGTH);
  }
  return result;
}

function isValidRoute(id) {
  if (id.length === 0 || id.length > ROUTE_MAX_LENGTH) {
    return false;
  }
  if (!/^[A-Za-z][A-Za-z0-9\/_-]*$/.test(id)) {
    return false;
  }
  return true;
}

function codeOfWidth(width) {
  if (width % 1 !== 0) {
    return 3;
  }
  if (width < 320) {
    return 1;
  }
  if (width > 1440) {
    return 2;
  }
  return 0;
}

function codeOfParts(parts) {
  if (parts % 1 !== 0) {
    return 3;
  }
  if (parts < 1) {
    return 1;
  }
  if (parts > 12) {
    return 2;
  }
  return 0;
}

function pushRoute(stack, id) {
  stack.push(id);
  return stack.length;
}

function popRoute(stack) {
  if (stack.length === 0) {
    return '';
  }
  return stack.pop();
}

function topRoute(stack) {
  if (stack.length === 0) {
    return '';
  }
  return stack[stack.length - 1];
}

function canBack(stack) {
  return stack.length > 1;
}

function replaceRoute(stack, id) {
  if (stack.length === 0) {
    return '';
  }
  stack[stack.length - 1] = id;
  return topRoute(stack);
}

function indexOfRoute(stack, id) {
  return stack.indexOf(id);
}

function copyState(state) {
  const result = {};
  const keys = Object.keys(state);
  for (let i = 0; i < keys.length; i++) {
    result[keys[i]] = state[keys[i]];
  }
  return result;
}

function historyPush(history, value, limit) {
  history.push(value);
  while (history.length > limit) {
    history.shift();
  }
  return history.length;
}

function pxOf(vp, density) {
  return Math.round(vp * density);
}

function vpOf(px, density) {
  return Math.round(px / density);
}

function lineHeightOf(fontSize) {
  return Math.floor(fontSize * 1.5);
}

function letterSpacingOf(fontSize) {
  return Math.round(fontSize * 2);
}

function clampChannel(value) {
  if (value < 0) {
    return 0;
  }
  if (value > 255) {
    return 255;
  }
  return value;
}

function blendChannel(base, overlay, alphaPercent) {
  const b = clampChannel(base);
  const o = clampChannel(overlay);
  return Math.round(b * (100 - alphaPercent) / 100 + o * alphaPercent / 100);
}

function gestureAccepted(distance, velocity, minDistance, minVelocity) {
  return distance >= minDistance || velocity >= minVelocity;
}

function transitionProgress(elapsed, duration) {
  if (duration <= 0) {
    return 100;
  }
  if (elapsed >= duration) {
    return 100;
  }
  if (elapsed <= 0) {
    return 0;
  }
  return Math.floor(elapsed * 100 / duration);
}

function themeKeyOf(index) {
  return 'theme_' + (index % 5);
}

function lruAccess(order, key, capacity) {
  const index = order.indexOf(key);
  const found = index >= 0;
  if (found) {
    order.splice(index, 1);
  }
  order.push(key);
  while (order.length > capacity) {
    order.shift();
  }
  return found;
}

function segmentCount(path) {
  if (path.length === 0) {
    return 0;
  }
  return path.split('/').length;
}

function isSafePath(path) {
  if (path.length === 0 || path.length > 128) {
    return false;
  }
  if (path.indexOf('..') >= 0) {
    return false;
  }
  const segments = path.split('/');
  for (let i = 0; i < segments.length; i++) {
    if (segments[i].length === 0) {
      return false;
    }
    if (!/^[A-Za-z0-9._-]+$/.test(segments[i])) {
      return false;
    }
  }
  return true;
}

export default {
  breakpointOf,
  columnsOf,
  gutterOf,
  marginOf,
  fontScaleOf,
  contentWidthOf,
  columnsForWidth,
  itemWidthOf,
  aspectHeightOf,
  partition,
  offsetOf,
  spanSum,
  isValidSpan,
  langOf,
  isRtl,
  densityBucket,
  qualifierOf,
  routeKeyOf,
  sanitizeRoute,
  isValidRoute,
  codeOfWidth,
  codeOfParts,
  pushRoute,
  popRoute,
  topRoute,
  canBack,
  replaceRoute,
  indexOfRoute,
  copyState,
  historyPush,
  pxOf,
  vpOf,
  lineHeightOf,
  letterSpacingOf,
  clampChannel,
  blendChannel,
  gestureAccepted,
  transitionProgress,
  themeKeyOf,
  lruAccess,
  segmentCount,
  isSafePath
};
