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

// DSL handling of casesfeature/imperativedynamiclayouts view/ImperativeView.ets (frameNodeFactory, setColumnNodeAttr,
// setRowNodeAttr, carousel refresh). The tree below is a typed transcription of jsonpage/foo.json.

// Mirrors the node types frameNodeFactory() can build; any other type returns null.
export const SUPPORTED_TYPES: string[] = ['Column', 'Row', 'Swiper', 'Image', 'Text'];
// Mirrors the images assigned by the refreshImage onClick() to carouselNodes[1..5].
export const REFRESH_IMAGES: string[] = ['app.media.movie6', 'app.media.movie7', 'app.media.movie8', 'app.media.movie9',
  'app.media.movie10'];
export const REFRESH_ID: string = 'refreshImage';

// Mirrors the css object of a DSL node (numbers that are absent become 0, opacity defaults to 1).
export class DslCss {
  width: string = '';
  height: string = '';
  fontSize: number = 0;
  fontColor: string = '';
  backgroundColor: string = '';
  borderRadius: number = 0;
  opacity: number = 1;
  alignItems: string = '';
  paddingLeft: number = 0;
  paddingRight: number = 0;
  marginTop: number = 0;
  marginBottom: number = 0;
  justifyContent: string = '';

  constructor(width: string, height: string, fontSize: number, fontColor: string, backgroundColor: string,
    borderRadius: number, opacity: number, alignItems: string, paddingLeft: number, paddingRight: number,
    marginTop: number, marginBottom: number, justifyContent: string) {
    this.width = width;
    this.height = height;
    this.fontSize = fontSize;
    this.fontColor = fontColor;
    this.backgroundColor = backgroundColor;
    this.borderRadius = borderRadius;
    this.opacity = opacity;
    this.alignItems = alignItems;
    this.paddingLeft = paddingLeft;
    this.paddingRight = paddingRight;
    this.marginTop = marginTop;
    this.marginBottom = marginBottom;
    this.justifyContent = justifyContent;
  }
}

// Mirrors class VM { type, id, content, css, children } of ImperativeView.ets.
export class DslNode {
  type: string = '';
  id: string = '';
  content: string = '';
  css: DslCss;
  children: DslNode[] = [];

  constructor(type: string, id: string, content: string, css: DslCss, children: DslNode[]) {
    this.type = type;
    this.id = id;
    this.content = content;
    this.css = css;
    this.children = children;
  }
}

// Transcription of jsonpage/foo.json.
const DSL_TREE: DslNode =
  new DslNode('Column', '', '',
    new DslCss('100%', '', 0, '', '', 0, 1, '', 0, 0, 0, 0, ''),
    [
      new DslNode('Row', '', '',
        new DslCss('100%', '', 0, '', '', 0, 1, '', 15, 15, 5, 5, 'FlexAlign.SpaceBetween'),
        [
          new DslNode('Text', '', '\u9996\u9875',
            new DslCss('', '', 24, '#ffffff', '', 0, 1, '', 0, 0, 0, 0, ''),
            []),
          new DslNode('Image', '', 'app.media.search',
            new DslCss('24', '24', 0, '', '', 0, 1, '', 0, 0, 0, 0, ''),
            [])
        ]),
      new DslNode('Swiper', '', '',
        new DslCss('100%', '', 0, '', '', 0, 1, '', 0, 0, 0, 0, ''),
        [
          new DslNode('Image', '', 'app.media.movie1',
            new DslCss('100%', '40%', 0, '', '', 0, 1, '', 0, 0, 0, 0, ''),
            []),
          new DslNode('Image', '', 'app.media.movie2',
            new DslCss('100%', '40%', 0, '', '', 0, 1, '', 0, 0, 0, 0, ''),
            []),
          new DslNode('Image', '', 'app.media.movie3',
            new DslCss('100%', '40%', 0, '', '', 0, 1, '', 0, 0, 0, 0, ''),
            [])
        ]),
      new DslNode('Row', '', '',
        new DslCss('100%', '', 0, '', '', 0, 1, '', 15, 15, 15, 15, 'FlexAlign.SpaceBetween'),
        [
          new DslNode('Text', '', '\u7cbe\u9009',
            new DslCss('75', '40', 0, '#000000', '#ffffff', 60, 1, '', 0, 0, 0, 0, ''),
            []),
          new DslNode('Text', '', '\u7535\u89c6\u5267',
            new DslCss('75', '40', 0, '#000000', '#808080', 60, 1, '', 0, 0, 0, 0, ''),
            []),
          new DslNode('Text', '', '\u7535\u5f71',
            new DslCss('75', '40', 0, '#000000', '#808080', 60, 1, '', 0, 0, 0, 0, ''),
            []),
          new DslNode('Text', '', '\u7efc\u827a',
            new DslCss('75', '40', 0, '#000000', '#808080', 60, 1, '', 0, 0, 0, 0, ''),
            [])
        ]),
      new DslNode('Row', '', '',
        new DslCss('100%', '', 0, '', '', 0, 1, '', 15, 15, 5, 5, 'FlexAlign.SpaceBetween'),
        [
          new DslNode('Text', '', '\u6bcf\u65e5\u63a8\u8350',
            new DslCss('', '', 24, '#ffffff', '', 0, 1, '', 0, 0, 0, 0, ''),
            []),
          new DslNode('Text', '', '\u66f4\u591a',
            new DslCss('', '', 20, '#ffffff', '', 0, 0.5, '', 0, 0, 0, 0, ''),
            [])
        ]),
      new DslNode('Row', '', '',
        new DslCss('100%', '', 0, '', '', 0, 1, '', 15, 15, 5, 5, 'FlexAlign.SpaceBetween'),
        [
          new DslNode('Column', '', '',
            new DslCss('', '', 0, '', '', 0, 1, 'HorizontalAlign.Start', 0, 0, 0, 0, ''),
            [
              new DslNode('Image', '', 'app.media.movie4',
                new DslCss('170', '120', 0, '', '', 10, 1, '', 0, 0, 0, 0, ''),
                []),
              new DslNode('Text', '', '\u7535\u5f711',
                new DslCss('', '', 0, '#ffffff', '', 0, 1, '', 0, 0, 0, 0, ''),
                [])
            ]),
          new DslNode('Column', '', '',
            new DslCss('', '', 0, '', '', 0, 1, 'HorizontalAlign.Start', 0, 0, 0, 0, ''),
            [
              new DslNode('Image', '', 'app.media.movie5',
                new DslCss('170', '120', 0, '', '', 10, 1, '', 0, 0, 0, 0, ''),
                []),
              new DslNode('Text', '', '\u7535\u5f712',
                new DslCss('', '', 0, '#ffffff', '', 0, 1, '', 0, 0, 0, 0, ''),
                [])
            ])
        ]),
      new DslNode('Text', 'refreshImage', '\u5237\u65b0',
        new DslCss('180', '40', 0, '#ffffff', '#0000FF', 60, 1, '', 0, 0, 0, 0, ''),
        [])
    ]);

// Mirrors frameNodeFactory(): the node kind created for a DSL type ('' when null is returned).
export function factoryKindOf(type: string): string {
  return SUPPORTED_TYPES.indexOf(type) >= 0 ? type : '';
}

// Mirrors setColumnNodeAttr(): 'HorizontalAlign.Start' maps to Start, everything else keeps Center.
export function columnAlignOf(alignItems: string): string {
  return alignItems === 'HorizontalAlign.Start' ? 'Start' : 'Center';
}

// Mirrors setRowNodeAttr(): padding / margin are applied only when present in the css.
export function appliesRowSpacing(left: number, right: number, top: number, bottom: number): boolean {
  return left !== 0 || right !== 0 || top !== 0 || bottom !== 0;
}

// Mirrors the depth-first walk of frameNodeFactory(): the node reached through child indexes.
function nodeAt(pathIndexes: number[]): DslNode | null {
  let node: DslNode = DSL_TREE;
  for (const index of pathIndexes) {
    if (!Number.isInteger(index) || index < 0 || index >= node.children.length) {
      return null;
    }
    node = node.children[index];
  }
  return node;
}

// Mirrors the type of the node at a path of child indexes ('' when the path does not exist).
export function typeAt(pathIndexes: number[]): string {
  const node: DslNode | null = nodeAt(pathIndexes);
  return node === null ? '' : node.type;
}

// Mirrors node.initialize(vm.content) for Text / Image nodes.
export function contentAt(pathIndexes: number[]): string {
  const node: DslNode | null = nodeAt(pathIndexes);
  return node === null ? '' : node.content;
}

// Mirrors the number of children appended to the node at a path.
export function childCountAt(pathIndexes: number[]): number {
  const node: DslNode | null = nodeAt(pathIndexes);
  return node === null ? -1 : node.children.length;
}

// Mirrors node.attribute.width(vm.css.width) of the node at a path.
export function widthAt(pathIndexes: number[]): string {
  const node: DslNode | null = nodeAt(pathIndexes);
  return node === null ? '' : node.css.width;
}

function collect(node: DslNode, type: string, out: DslNode[]): DslNode[] {
  if (type === '' || node.type === type) {
    out.push(node);
  }
  for (const child of node.children) {
    collect(child, type, out);
  }
  return out;
}

// Mirrors how many frame nodes of a type the factory creates for the DSL ('' counts all nodes).
export function nodeCountOf(type: string): number {
  return collect(DSL_TREE, type, []).length;
}

function depthOf(node: DslNode): number {
  let max: number = 0;
  for (const child of node.children) {
    const d: number = depthOf(child);
    if (d > max) {
      max = d;
    }
  }
  return max + 1;
}

// Mirrors the nesting depth of the generated node tree.
export function treeDepth(): number {
  return depthOf(DSL_TREE);
}

// Mirrors the Text contents in creation (pre-order) order.
export function textContents(): string[] {
  return collect(DSL_TREE, 'Text', []).map((n: DslNode): string => n.content);
}

// Mirrors carouselNodes: Image nodes pushed in creation order.
export function carouselImages(): string[] {
  return collect(DSL_TREE, 'Image', []).map((n: DslNode): string => n.content);
}

// Mirrors the carousel after the refresh click: carouselNodes[1..5] get movie6 .. movie10.
export function carouselAfterRefresh(): string[] {
  const images: string[] = carouselImages();
  for (let i: number = 1; i < images.length && i - 1 < REFRESH_IMAGES.length; i++) {
    images[i] = REFRESH_IMAGES[i - 1];
  }
  return images;
}

// Mirrors the node whose id gets the refresh click handler.
export function hasRefreshNode(id: string): boolean {
  return collect(DSL_TREE, '', []).some((n: DslNode): boolean => n.id === id);
}

// Mirrors the font size of the Text with the given content (0 when not set or not found).
export function fontSizeOfText(content: string): number {
  const nodes: DslNode[] = collect(DSL_TREE, 'Text', []).filter((n: DslNode): boolean => n.content === content);
  return nodes.length === 0 ? 0 : nodes[0].css.fontSize;
}

// Mirrors the refresh button: one click swaps the carousel images and disables the button.
export class RefreshButtonState {
  enabled: boolean = true;
  clicks: number = 0;
  images: string[] = carouselImages();

  // Mirrors node.attribute.onClick() of refreshImage; a disabled node ignores further clicks.
  click(): number {
    if (!this.enabled) {
      return this.clicks;
    }
    this.clicks++;
    this.images = carouselAfterRefresh();
    this.enabled = false;
    return this.clicks;
  }

  // Mirrors the image currently shown by carouselNodes[index].
  imageAt(index: number): string {
    if (!Number.isInteger(index) || index < 0 || index >= this.images.length) {
      return '';
    }
    return this.images[index];
  }
}
