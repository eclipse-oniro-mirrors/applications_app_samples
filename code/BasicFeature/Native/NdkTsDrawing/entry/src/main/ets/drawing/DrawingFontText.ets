/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { drawing, common2D } from '@kit.ArkGraphics2D';
import { point, rgba } from './DrawingTypes';

/**
 * Snapshot of the font style state.
 */
export interface FontSnapshot {
  size: number;
  scaleX: number;
  skewX: number;
  subpixel: boolean;
  linearMetrics: boolean;
  embolden: boolean;
  hinting: drawing.FontHinting;
  edging: drawing.FontEdging;
  baselineSnap: boolean;
  embeddedBitmaps: boolean;
  forceAutoHinting: boolean;
  themeFollowed: boolean;
  familyName: string;
  bold: boolean;
  italic: boolean;
}

/**
 * Snapshot of the font metrics.
 */
export interface FontMetricsSnapshot {
  top: number;
  ascent: number;
  descent: number;
  bottom: number;
  leading: number;
}

/**
 * Create a font with the given size.
 *
 * @param { number } size - Text size in px.
 * @returns { drawing.Font } Configured font.
 */
export function createFont(size: number): drawing.Font {
  const font: drawing.Font = new drawing.Font();
  font.setSize(size);
  return font;
}

/**
 * Apply every font style setter.
 *
 * @param { drawing.Font } font - Target font.
 */
export function applyFontStyle(font: drawing.Font): void {
  font.enableSubpixel(true);
  font.enableEmbolden(true);
  font.enableLinearMetrics(true);
  font.setScaleX(1.1);
  font.setSkewX(0.1);
  font.setEdging(drawing.FontEdging.SUBPIXEL_ANTI_ALIAS);
  font.setHinting(drawing.FontHinting.FULL);
  font.setBaselineSnap(true);
  font.setEmbeddedBitmaps(true);
  font.setForceAutoHinting(true);
  font.setThemeFontFollowed(false);
}

/**
 * Read every readable font attribute.
 *
 * @param { drawing.Font } font - Source font.
 * @returns { FontSnapshot } Font state snapshot.
 */
export function snapshotFont(font: drawing.Font): FontSnapshot {
  const typeface: drawing.Typeface = font.getTypeface();
  const snapshot: FontSnapshot = {
    size: font.getSize(),
    scaleX: font.getScaleX(),
    skewX: font.getSkewX(),
    subpixel: font.isSubpixel(),
    linearMetrics: font.isLinearMetrics(),
    embolden: font.isEmbolden(),
    hinting: font.getHinting(),
    edging: font.getEdging(),
    baselineSnap: font.isBaselineSnap(),
    embeddedBitmaps: font.isEmbeddedBitmaps(),
    forceAutoHinting: font.isForceAutoHinting(),
    themeFollowed: font.isThemeFontFollowed(),
    familyName: typeface.getFamilyName(),
    bold: typeface.isBold(),
    italic: typeface.isItalic()
  };
  return snapshot;
}

/**
 * Read the font metrics.
 *
 * @param { drawing.Font } font - Source font.
 * @returns { FontMetricsSnapshot } Font metrics snapshot.
 */
export function snapshotMetrics(font: drawing.Font): FontMetricsSnapshot {
  const metrics: drawing.FontMetrics = font.getMetrics();
  const snapshot: FontMetricsSnapshot = {
    top: metrics.top,
    ascent: metrics.ascent,
    descent: metrics.descent,
    bottom: metrics.bottom,
    leading: metrics.leading
  };
  return snapshot;
}

/**
 * Measure the width of a string.
 *
 * @param { string } text - Text to measure.
 * @param { number } size - Text size in px.
 * @param { drawing.TextEncoding } encoding - Text encoding.
 * @returns { number } Measured width in px.
 */
export function measureString(text: string, size: number, encoding: drawing.TextEncoding): number {
  const font: drawing.Font = createFont(size);
  return font.measureText(text, encoding);
}

/**
 * Measure the width of a single character.
 *
 * @param { string } text - Single character text.
 * @param { number } size - Text size in px.
 * @returns { number } Measured width in px.
 */
export function measureCharacter(text: string, size: number): number {
  const font: drawing.Font = createFont(size);
  font.enableSubpixel(true);
  return font.measureSingleCharacter(text);
}

/**
 * Measure a single character with font features.
 *
 * @param { string } text - Single character text.
 * @param { number } size - Text size in px.
 * @returns { number } Measured width in px.
 */
export function measureCharacterWithFeatures(text: string, size: number): number {
  const font: drawing.Font = createFont(size);
  const features: drawing.FontFeature[] = [{ name: 'liga', value: 1 }, { name: 'kern', value: 1 }];
  return font.measureSingleCharacterWithFeatures(text, features);
}

/**
 * Count the characters that can be shaped with the default typeface.
 *
 * @param { string } text - Text to count.
 * @returns { number } Number of characters counted by the font.
 */
export function countGlyphs(text: string): number {
  const font: drawing.Font = createFont(32);
  return font.countText(text);
}

/**
 * Convert text into glyph ids.
 *
 * @param { string } text - Source text.
 * @returns { number[] } Glyph ids.
 */
export function glyphIds(text: string): number[] {
  const font: drawing.Font = createFont(32);
  return font.textToGlyphs(text);
}

/**
 * Convert a limited number of characters into glyph ids.
 *
 * @param { string } text - Source text.
 * @param { number } glyphCount - Maximum number of glyphs.
 * @returns { number[] } Glyph ids.
 */
export function glyphIdsLimited(text: string, glyphCount: number): number[] {
  const font: drawing.Font = createFont(32);
  return font.textToGlyphs(text, glyphCount);
}

/**
 * Read glyph advance widths.
 *
 * @param { string } text - Source text.
 * @returns { number[] } Glyph widths in px.
 */
export function glyphWidths(text: string): number[] {
  const font: drawing.Font = createFont(32);
  const ids: number[] = font.textToGlyphs(text);
  return font.getWidths(ids);
}

/**
 * Read glyph bounding boxes as a flat array.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @returns { number[] } Four numbers per glyph, empty when no glyph is found.
 */
export function glyphBounds(text: string, size: number): number[] {
  const font: drawing.Font = createFont(size);
  const ids: number[] = font.textToGlyphs(text);
  if (ids.length === 0) {
    return [];
  }
  const rects: common2D.Rect[] = font.getBounds(ids);
  const flat: number[] = [];
  for (let index: number = 0; index < rects.length; index++) {
    flat.push(rects[index].left);
    flat.push(rects[index].top);
    flat.push(rects[index].right);
    flat.push(rects[index].bottom);
  }
  return flat;
}

/**
 * Convert text into an outline path.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @returns { drawing.Path } Text outline path.
 */
export function textOutline(text: string, size: number): drawing.Path {
  const font: drawing.Font = createFont(size);
  return font.getTextPath(text, text.length, 10, 100);
}

/**
 * Convert text into an outline path with fallback typefaces.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @returns { drawing.Path } Text outline path.
 */
export function textOutlineWithFallback(text: string, size: number): drawing.Path {
  const font: drawing.Font = createFont(size);
  return font.getTextPathWithFallback(text, text.length, 10, 100);
}

/**
 * Build the outline path of one glyph.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @param { number } index - Glyph index inside the text.
 * @returns { drawing.Path } Glyph outline path, empty when the index is invalid.
 */
export function glyphOutline(text: string, size: number, index: number): drawing.Path {
  const font: drawing.Font = createFont(size);
  const ids: number[] = font.textToGlyphs(text);
  if (index < 0 || index >= ids.length) {
    return new drawing.Path();
  }
  return font.createPathForGlyph(ids[index]);
}

/**
 * Create a text blob from a string.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @returns { drawing.TextBlob } Text blob.
 */
export function createTextBlob(text: string, size: number): drawing.TextBlob {
  const font: drawing.Font = createFont(size);
  return drawing.TextBlob.makeFromString(text, font, drawing.TextEncoding.TEXT_ENCODING_UTF8);
}

/**
 * Read the text blob bounds as a flat array.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @returns { number[] } Left, top, right and bottom of the blob.
 */
export function textBlobBounds(text: string, size: number): number[] {
  const blob: drawing.TextBlob = createTextBlob(text, size);
  const bounds: common2D.Rect = blob.bounds();
  const result: number[] = [bounds.left, bounds.top, bounds.right, bounds.bottom];
  return result;
}

/**
 * Check whether two blobs of the same text share the same unique id.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @returns { boolean } Whether both blobs report the same id.
 */
export function textBlobIdStable(text: string, size: number): boolean {
  const first: drawing.TextBlob = createTextBlob(text, size);
  const second: drawing.TextBlob = createTextBlob(text, size);
  return first.uniqueID() === second.uniqueID();
}

/**
 * Create a text blob from a run buffer.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @returns { drawing.TextBlob } Text blob built from glyph runs.
 */
export function createRunBufferBlob(text: string, size: number): drawing.TextBlob {
  const font: drawing.Font = createFont(size);
  const ids: number[] = font.textToGlyphs(text);
  const buffers: drawing.TextBlobRunBuffer[] = [];
  for (let index: number = 0; index < ids.length; index++) {
    buffers.push({ glyph: ids[index], positionX: index * size, positionY: 0 });
  }
  const bounds: common2D.Rect = { left: 0, top: 0, right: size * ids.length, bottom: size };
  return drawing.TextBlob.makeFromRunBuffer(buffers, font, bounds);
}

/**
 * Create a text blob positioned with explicit points.
 *
 * @param { string } text - Source text.
 * @param { number } size - Text size in px.
 * @returns { drawing.TextBlob } Text blob.
 */
export function createPosTextBlob(text: string, size: number): drawing.TextBlob {
  const font: drawing.Font = createFont(size);
  const points: common2D.Point[] = [];
  for (let index: number = 0; index < text.length; index++) {
    points.push(point(index * size, size));
  }
  return drawing.TextBlob.makeFromPosText(text, text.length, points, font);
}

/**
 * Read the default typeface carried by a font.
 *
 * @returns { drawing.Typeface } Default typeface.
 */
export function loadSystemTypeface(): drawing.Typeface {
  const font: drawing.Font = createFont(32);
  return font.getTypeface();
}

/**
 * Build typeface arguments with one variation axis.
 *
 * @returns { drawing.TypefaceArguments } Typeface arguments.
 */
export function typefaceVariation(): drawing.TypefaceArguments {
  const args: drawing.TypefaceArguments = new drawing.TypefaceArguments();
  args.addVariation('wght', 400);
  args.addVariation('wdth', 100);
  return args;
}

/**
 * Build a typeface from the current typeface and variation arguments.
 *
 * @returns { drawing.Typeface } Typeface carrying the requested variations.
 */
export function makeTypefaceFromCurrent(): drawing.Typeface {
  const current: drawing.Typeface = loadSystemTypeface();
  return current.makeFromCurrent(typefaceVariation());
}

/**
 * Apply a custom typeface on a font.
 *
 * @param { drawing.Font } font - Target font.
 * @returns { string } Family name reported after applying the typeface.
 */
export function applyTypeface(font: drawing.Font): string {
  const typeface: drawing.Typeface = loadSystemTypeface();
  font.setTypeface(typeface);
  const applied: drawing.Typeface = font.getTypeface();
  return applied.getFamilyName();
}

/**
 * Draw one character with the single character API.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 * @param { string } text - Text to draw.
 */
export function paintSingleCharacter(canvas: drawing.Canvas, text: string): void {
  const font: drawing.Font = createFont(48);
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 0x00, 0x66, 0xCC));
  canvas.attachBrush(brush);
  canvas.drawSingleCharacter(text, font, 20, 120);
  const features: drawing.FontFeature[] = [{ name: 'liga', value: 1 }];
  canvas.drawSingleCharacterWithFeatures(text, font, 80, 120, features);
  canvas.detachBrush();
}

/**
 * Draw glyphs with explicit positions.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 * @param { string } text - Text to draw.
 */
export function paintGlyphs(canvas: drawing.Canvas, text: string): void {
  const font: drawing.Font = createFont(40);
  const ids: number[] = font.textToGlyphs(text);
  if (ids.length === 0) {
    return;
  }
  const positions: common2D.Point[] = [];
  for (let index: number = 0; index < ids.length; index++) {
    positions.push(point(10 + index * 40, 100));
  }
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 0x33, 0x99, 0x33));
  canvas.attachBrush(brush);
  canvas.drawGlyphs(ids, 0, positions, 0, ids.length, font);
  canvas.detachBrush();
}

/**
 * Draw text with a text blob, used by the page entry.
 *
 * @param { drawing.Canvas } canvas - Target canvas.
 * @param { string } text - Text to draw.
 */
export function paintTextBlob(canvas: drawing.Canvas, text: string): void {
  const blob: drawing.TextBlob = createTextBlob(text, 48);
  const brush: drawing.Brush = new drawing.Brush();
  brush.setColor(rgba(255, 0x11, 0x22, 0x33));
  canvas.attachBrush(brush);
  canvas.drawTextBlob(blob, 20, 120);
  canvas.detachBrush();
}
