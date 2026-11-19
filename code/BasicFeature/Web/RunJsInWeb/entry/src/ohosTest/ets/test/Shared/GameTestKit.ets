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

/**
 * Additional lightweight utilities shared by the RunJsInWeb suites.
 */

/**
 * Parsed view of an https url.
 */
export class UrlParts {
  private scheme: string;
  private host: string;
  private path: string;

  constructor(scheme: string, host: string, path: string) {
    this.scheme = scheme;
    this.host = host;
    this.path = path;
  }

  public static parse(url: string): UrlParts {
    const schemeEnd: number = url.indexOf('://');
    if (schemeEnd < 0) {
      return new UrlParts('', '', url);
    }
    const scheme: string = url.substring(0, schemeEnd);
    const rest: string = url.substring(schemeEnd + 3);
    const pathStart: number = rest.indexOf('/');
    if (pathStart < 0) {
      return new UrlParts(scheme, rest, '');
    }
    return new UrlParts(scheme, rest.substring(0, pathStart), rest.substring(pathStart));
  }

  public getScheme(): string {
    return this.scheme;
  }

  public getHost(): string {
    return this.host;
  }

  public getPath(): string {
    return this.path;
  }

  public isHttps(): boolean {
    return this.scheme === 'https';
  }

  public isSecureHost(): boolean {
    return this.host.endsWith('.github.io');
  }

  public hasQuery(): boolean {
    return this.path.indexOf('?') >= 0;
  }

  public length(): number {
    return this.scheme.length + 3 + this.host.length + this.path.length;
  }
}

/**
 * Axis aligned rectangle used by layout and hit testing suites.
 */
export class GeometryBox {
  public left: number;
  public top: number;
  public width: number;
  public height: number;

  constructor(left: number, top: number, width: number, height: number) {
    this.left = left;
    this.top = top;
    this.width = width;
    this.height = height;
  }

  public right(): number {
    return this.left + this.width;
  }

  public bottom(): number {
    return this.top + this.height;
  }

  public area(): number {
    return this.width * this.height;
  }

  public contains(x: number, y: number): boolean {
    return x >= this.left && x <= this.right() && y >= this.top && y <= this.bottom();
  }

  public overlaps(other: GeometryBox): boolean {
    return this.left < other.right() && other.left < this.right() &&
      this.top < other.bottom() && other.top < this.bottom();
  }

  public centerX(): number {
    return this.left + this.width / 2;
  }

  public centerY(): number {
    return this.top + this.height / 2;
  }

  public isDegenerate(): boolean {
    return this.width <= 0 || this.height <= 0;
  }
}

/**
 * Fixed capacity ring buffer.
 */
export class CircularBuffer {
  private readonly capacity: number;
  private values: number[] = [];

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public push(value: number): void {
    if (this.capacity <= 0) {
      return;
    }
    this.values.push(value);
    if (this.values.length > this.capacity) {
      this.values.shift();
    }
  }

  public size(): number {
    return this.values.length;
  }

  public isFull(): boolean {
    return this.values.length === this.capacity;
  }

  public get(index: number): number {
    if (index < 0 || index >= this.values.length) {
      return -1;
    }
    return this.values[index];
  }

  public last(): number {
    if (this.values.length === 0) {
      return -1;
    }
    return this.values[this.values.length - 1];
  }

  public sum(): number {
    let total: number = 0;
    for (let i = 0; i < this.values.length; i++) {
      total += this.values[i];
    }
    return total;
  }

  public clear(): void {
    this.values = [];
  }
}

/**
 * FIFO command queue used to model serialized UI operations.
 */
export class CommandQueue {
  private commands: string[] = [];
  private executed: string[] = [];

  public enqueue(command: string): void {
    this.commands.push(command);
  }

  public dequeue(): string {
    if (this.commands.length === 0) {
      return '';
    }
    const command: string = this.commands.shift() as string;
    this.executed.push(command);
    return command;
  }

  public peek(): string {
    if (this.commands.length === 0) {
      return '';
    }
    return this.commands[0];
  }

  public size(): number {
    return this.commands.length;
  }

  public isEmpty(): boolean {
    return this.commands.length === 0;
  }

  public executedCommands(): string[] {
    return [...this.executed];
  }

  public clear(): void {
    this.commands = [];
    this.executed = [];
  }
}

/**
 * Token bucket used by rate limiting suites.
 */
export class TokenBucket {
  private readonly capacity: number;
  private tokens: number;

  constructor(capacity: number) {
    this.capacity = capacity;
    this.tokens = capacity;
  }

  public tryConsume(count: number = 1): boolean {
    if (count <= 0 || this.tokens < count) {
      return false;
    }
    this.tokens -= count;
    return true;
  }

  public refill(count: number): void {
    if (count <= 0) {
      return;
    }
    this.tokens += count;
    if (this.tokens > this.capacity) {
      this.tokens = this.capacity;
    }
  }

  public available(): number {
    return this.tokens;
  }

  public getCapacity(): number {
    return this.capacity;
  }
}
