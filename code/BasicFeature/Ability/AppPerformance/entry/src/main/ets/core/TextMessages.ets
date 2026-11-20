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

import { common } from '@kit.AbilityKit';
import { MESSAGE_CATALOG, LEGACY_MESSAGES, MessageEntry, LegacyMessage } from './MessageCatalog';

/** Injectable lookup keeps model checks independent from the current UI Context. */
export interface TextResourceResolver {
  resolve(resourceName: string): string;
}

let textResolver: TextResourceResolver | undefined = undefined;
const MESSAGE_BY_ID: Map<string, MessageEntry> = new Map<string, MessageEntry>();
const LEGACY_EXACT: Map<string, string> = new Map<string, string>();
// Cache identities only, never the locale-dependent strings resolved from them.
MESSAGE_CATALOG.forEach((entry: MessageEntry): void => {
  MESSAGE_BY_ID.set(entry.id, entry);
});
LEGACY_MESSAGES.forEach((entry: LegacyMessage): void => {
  if (entry.pattern === undefined) { LEGACY_EXACT.set(entry.source, entry.id); }
});

/** Bind a host lookup port, not a translated-string cache. */
export function setTextResourceResolver(resolver: TextResourceResolver | undefined): void {
  textResolver = resolver;
}

/** Capture the exact provider for an owned UI lifecycle; restore before its destruction acknowledgement. */
export function currentTextResourceResolver(): TextResourceResolver | undefined {
  return textResolver;
}

/** Synchronous model/read scope only; restore even when an assertion or resolver throws. */
export function withTextResourceResolver<T>(resolver: TextResourceResolver, read: () => T): T {
  const previous: TextResourceResolver | undefined = textResolver;
  textResolver = resolver;
  try {
    return read();
  } finally {
    textResolver = previous;
  }
}

/** Single-pass substitution: values containing braces must never become format instructions. */
export function formatMessage(template: string, args: (string | number)[]): string {
  return template.replace(/\{([0-9]+)\}|%([0-9]+)\$s/g,
    (token: string, braceIndex: string, resourceIndex: string): string => {
      const position: number = braceIndex !== undefined ? Number(braceIndex) : Number(resourceIndex) - 1;
      return position < args.length ? `${args[position]}` : token;
    });
}

/** Resource names are declared in MessageCatalog; English fallback works without a host resolver. */
export function message(id: string, args: (string | number)[] = []): string {
  const entry: MessageEntry | undefined = MESSAGE_BY_ID.get(id);
  if (entry === undefined) { return id; }
  let template: string = entry.fallback;
  if (textResolver !== undefined) {
    try {
      template = textResolver.resolve(entry.resourceName);
    } catch (error) {
      // A missing localized resource must not alter any execution or persistence outcome.
    }
  }
  return formatMessage(template, args);
}

/**
 * Historical prose is a read-only input to this formatter, never a replacement for a status code.
 * Whole-template matching (not substring replacement) keeps external errors/unknown data intact.
 * Payload preview, first line/entry and form values are explicitly opaque arguments.
 */
export function localize(value: string): string {
  return localizeAtDepth(value, 0);
}

function localizeAtDepth(value: string, depth: number): string {
  if (depth >= 8 || value.length === 0 || value.length > 65536) { return value; }
  const exact: string | undefined = LEGACY_EXACT.get(value);
  if (exact !== undefined) { return message(exact); }
  // Already-rendered English/numbers/checksums need no template walk. Machine aliases resolved above.
  if (!/[\u3400-\u9fff]/.test(value)) { return value; }
  for (const entry of LEGACY_MESSAGES) {
    if (entry.pattern === undefined) { continue; }
    const matched: RegExpExecArray | null = entry.pattern.exec(value);
    if (matched === null) { continue; }
    const args: string[] = matched.slice(1).map((part: string, index: number): string =>
      entry.opaque.indexOf(index) >= 0 ? part : localizeAtDepth(part, depth + 1));
    return message(entry.id, args);
  }
  // Legacy text() methods join independently formatted fields. Only known display separators split.
  const separators: string[] = ['\n', '｜', '；', ' · ', ' / '];
  for (const separator of separators) {
    if (value.indexOf(separator) < 0) { continue; }
    return value.split(separator).map((part: string): string => localizeAtDepth(part, depth + 1)).join(separator);
  }
  return value;
}

class ContextTextResolver implements TextResourceResolver {
  private readonly context: common.Context;

  constructor(context: common.Context) {
    this.context = context;
  }

  resolve(resourceName: string): string {
    return this.context.resourceManager.getStringByNameSync(resourceName);
  }
}

/** Strict named lookup: never rebind the global provider or turn a lookup failure into expected UI text. */
export function contextMessage(context: common.Context, id: string, args: (string | number)[] = []): string {
  const entry: MessageEntry | undefined = MESSAGE_BY_ID.get(id);
  if (entry === undefined) { throw new Error('Unknown application message identity'); }
  return formatMessage(new ContextTextResolver(context).resolve(entry.resourceName), args);
}

/** Bind the current entry Context without caching localized strings. */
export function setTextContext(context: common.Context | undefined): void {
  setTextResourceResolver(context === undefined ? undefined : new ContextTextResolver(context));
}
