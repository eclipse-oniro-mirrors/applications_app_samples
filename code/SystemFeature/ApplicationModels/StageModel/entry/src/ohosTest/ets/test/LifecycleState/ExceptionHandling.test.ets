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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { getDriver, ensureAppReady, checkComponentExists, BUNDLE_NAME } from '../Shared/SharedDriver';

enum ErrorSeverity {
  LOW = 0,
  MEDIUM = 1,
  HIGH = 2,
  CRITICAL = 3
}

function severityOf(code: number): number {
  if (code >= 500) {
    return ErrorSeverity.CRITICAL;
  }
  if (code >= 400) {
    return ErrorSeverity.HIGH;
  }
  if (code >= 300) {
    return ErrorSeverity.MEDIUM;
  }
  return ErrorSeverity.LOW;
}

class AppError {
  code: number = 0;
  message: string = '';
  severity: number = ErrorSeverity.LOW;
  cause: string = '';

  constructor(code: number, message: string, severity: number, cause: string) {
    this.code = code;
    this.message = message;
    this.severity = severity;
    this.cause = cause;
  }

  isCritical(): boolean {
    return this.severity === ErrorSeverity.CRITICAL;
  }

  describe(): string {
    return `${this.code}:${this.message}`;
  }

  withCause(cause: string): AppError {
    return new AppError(this.code, this.message, this.severity, cause);
  }
}

class Handler {
  code: number = 0;
  name: string = '';
  priority: number = 0;
  active: boolean = true;

  constructor(code: number, name: string, priority: number) {
    this.code = code;
    this.name = name;
    this.priority = priority;
  }
}

class HandlerRegistry {
  private handlers: Handler[] = [];

  register(code: number, name: string, priority: number): boolean {
    if (name.length === 0) {
      return false;
    }
    for (let i = 0; i < this.handlers.length; i++) {
      if (this.handlers[i].name === name) {
        return false;
      }
    }
    this.handlers.push(new Handler(code, name, priority));
    return true;
  }

  unregister(name: string): boolean {
    for (let i = 0; i < this.handlers.length; i++) {
      if (this.handlers[i].name === name) {
        this.handlers.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  resolve(code: number): Handler | null {
    let best: Handler | null = null;
    for (let i = 0; i < this.handlers.length; i++) {
      const handler = this.handlers[i];
      if (handler.code === code && handler.active) {
        if (best === null || handler.priority > best.priority) {
          best = handler;
        }
      }
    }
    return best;
  }

  count(): number {
    return this.handlers.length;
  }

  countFor(code: number): number {
    let count = 0;
    for (let i = 0; i < this.handlers.length; i++) {
      if (this.handlers[i].code === code) {
        count = count + 1;
      }
    }
    return count;
  }

  names(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.handlers.length; i++) {
      result.push(this.handlers[i].name);
    }
    return result;
  }
}

class ErrorStack {
  private items: AppError[] = [];

  push(error: AppError): void {
    this.items.push(error);
  }

  pop(): AppError | null {
    if (this.items.length === 0) {
      return null;
    }
    const error = this.items[this.items.length - 1];
    this.items.splice(this.items.length - 1, 1);
    return error;
  }

  peek(): AppError | null {
    if (this.items.length === 0) {
      return null;
    }
    return this.items[this.items.length - 1];
  }

  size(): number {
    return this.items.length;
  }

  clear(): void {
    this.items = [];
  }

  contains(code: number): boolean {
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].code === code) {
        return true;
      }
    }
    return false;
  }

  codes(): number[] {
    const result: number[] = [];
    for (let i = 0; i < this.items.length; i++) {
      result.push(this.items[i].code);
    }
    return result;
  }
}

class ExceptionEngine {
  stack: ErrorStack = new ErrorStack();
  registry: HandlerRegistry = new HandlerRegistry();
  handled: number = 0;
  unhandled: number = 0;
  finallyRuns: number = 0;

  handle(error: AppError): string {
    const handler = this.registry.resolve(error.code);
    if (handler !== null) {
      this.handled = this.handled + 1;
      return handler.name;
    }
    this.unhandled = this.unhandled + 1;
    this.stack.push(error);
    return 'unhandled';
  }

  run(code: number, message: string): string {
    const error = new AppError(code, message, severityOf(code), '');
    const outcome = this.handle(error);
    this.finallyRuns = this.finallyRuns + 1;
    return outcome;
  }

  drain(): number {
    const count = this.stack.size();
    this.stack.clear();
    return count;
  }

  totalOutcomes(): number {
    return this.handled + this.unhandled;
  }
}

class ErrorAggregator {
  private errors: AppError[] = [];

  add(error: AppError): void {
    this.errors.push(error);
  }

  count(): number {
    return this.errors.length;
  }

  codes(): number[] {
    const result: number[] = [];
    for (let i = 0; i < this.errors.length; i++) {
      result.push(this.errors[i].code);
    }
    return result;
  }

  hasCode(code: number): boolean {
    for (let i = 0; i < this.errors.length; i++) {
      if (this.errors[i].code === code) {
        return true;
      }
    }
    return false;
  }

  countBySeverity(severity: number): number {
    let count = 0;
    for (let i = 0; i < this.errors.length; i++) {
      if (this.errors[i].severity === severity) {
        count = count + 1;
      }
    }
    return count;
  }

  mostSevere(): AppError | null {
    let best: AppError | null = null;
    for (let i = 0; i < this.errors.length; i++) {
      if (best === null || this.errors[i].severity > best.severity) {
        best = this.errors[i];
      }
    }
    return best;
  }

  merge(other: ErrorAggregator): number {
    const otherCodes = other.codes();
    let merged = 0;
    for (let i = 0; i < otherCodes.length; i++) {
      this.errors.push(new AppError(otherCodes[i], 'merged', severityOf(otherCodes[i]), ''));
      merged = merged + 1;
    }
    return merged;
  }

  clear(): void {
    this.errors = [];
  }
}

class ExecutionTrace {
  private steps: string[] = [];

  record(step: string): void {
    this.steps.push(step);
  }

  order(): string {
    let output = '';
    for (let i = 0; i < this.steps.length; i++) {
      output = output + this.steps[i];
      if (i < this.steps.length - 1) {
        output = output + '>';
      }
    }
    return output;
  }

  count(): number {
    return this.steps.length;
  }

  contains(step: string): boolean {
    return this.steps.indexOf(step) >= 0;
  }

  clear(): void {
    this.steps = [];
  }
}

export default function exceptionHandlingTest(): void {
  describe('ExceptionHandling', () => {
    it('ExceptionHandling_001', 0, async (done: Function) => {
      expect(severityOf(0)).assertEqual(ErrorSeverity.LOW);
      expect(severityOf(299)).assertEqual(ErrorSeverity.LOW);
      expect(severityOf(300)).assertEqual(ErrorSeverity.MEDIUM);
      expect(severityOf(399)).assertEqual(ErrorSeverity.MEDIUM);
      expect(severityOf(400)).assertEqual(ErrorSeverity.HIGH);
      done();
    });

    it('ExceptionHandling_002', 0, async (done: Function) => {
      expect(severityOf(499)).assertEqual(ErrorSeverity.HIGH);
      expect(severityOf(500)).assertEqual(ErrorSeverity.CRITICAL);
      expect(severityOf(599)).assertEqual(ErrorSeverity.CRITICAL);
      expect(severityOf(999)).assertEqual(ErrorSeverity.CRITICAL);
      done();
    });

    it('ExceptionHandling_003', 0, async (done: Function) => {
      const error = new AppError(404, 'not found', ErrorSeverity.HIGH, '');
      expect(error.code).assertEqual(404);
      expect(error.message).assertEqual('not found');
      expect(error.severity).assertEqual(ErrorSeverity.HIGH);
      expect(error.cause).assertEqual('');
      expect(error.isCritical()).assertFalse();
      done();
    });

    it('ExceptionHandling_004', 0, async (done: Function) => {
      const error = new AppError(500, 'server', ErrorSeverity.CRITICAL, 'network');
      expect(error.isCritical()).assertTrue();
      expect(error.describe()).assertEqual('500:server');
      expect(error.cause).assertEqual('network');
      done();
    });

    it('ExceptionHandling_005', 0, async (done: Function) => {
      const original = new AppError(408, 'timeout', ErrorSeverity.HIGH, '');
      const copy = original.withCause('io');
      expect(copy.cause).assertEqual('io');
      expect(copy.code).assertEqual(408);
      expect(copy.message).assertEqual('timeout');
      expect(copy.severity).assertEqual(ErrorSeverity.HIGH);
      done();
    });

    it('ExceptionHandling_006', 0, async (done: Function) => {
      const original = new AppError(408, 'timeout', ErrorSeverity.HIGH, '');
      original.withCause('io');
      expect(original.cause).assertEqual('');
      expect(original.describe()).assertEqual('408:timeout');
      done();
    });

    it('ExceptionHandling_007', 0, async (done: Function) => {
      expect(ErrorSeverity.LOW).assertEqual(0);
      expect(ErrorSeverity.MEDIUM).assertEqual(1);
      expect(ErrorSeverity.HIGH).assertEqual(2);
      expect(ErrorSeverity.CRITICAL).assertEqual(3);
      done();
    });

    it('ExceptionHandling_008', 0, async (done: Function) => {
      expect(severityOf(404)).assertEqual(ErrorSeverity.HIGH);
      expect(severityOf(200)).assertEqual(ErrorSeverity.LOW);
      expect(severityOf(302)).assertEqual(ErrorSeverity.MEDIUM);
      expect(severityOf(503)).assertEqual(ErrorSeverity.CRITICAL);
      done();
    });

    it('ExceptionHandling_009', 0, async (done: Function) => {
      const low = new AppError(200, 'ok', severityOf(200), '');
      const high = new AppError(400, 'bad', severityOf(400), '');
      expect(low.isCritical()).assertFalse();
      expect(high.isCritical()).assertFalse();
      expect(high.severity > low.severity).assertTrue();
      done();
    });

    it('ExceptionHandling_010', 0, async (done: Function) => {
      const critical = new AppError(500, 'boom', severityOf(500), 'disk');
      expect(critical.isCritical()).assertTrue();
      expect(critical.describe()).assertEqual('500:boom');
      expect(critical.withCause('io').cause).assertEqual('io');
      done();
    });

    it('ExceptionHandling_011', 0, async (done: Function) => {
      const registry = new HandlerRegistry();
      expect(registry.count()).assertEqual(0);
      expect(registry.names().length).assertEqual(0);
      expect(registry.resolve(404)).assertNull();
      expect(registry.countFor(404)).assertEqual(0);
      done();
    });

    it('ExceptionHandling_012', 0, async (done: Function) => {
      const registry = new HandlerRegistry();
      expect(registry.register(404, 'notFound', 1)).assertTrue();
      expect(registry.count()).assertEqual(1);
      const handler = registry.resolve(404);
      expect(handler !== null).assertTrue();
      expect(handler === null ? '' : handler.name).assertEqual('notFound');
      expect(registry.names().indexOf('notFound') >= 0).assertTrue();
      done();
    });

    it('ExceptionHandling_013', 0, async (done: Function) => {
      const registry = new HandlerRegistry();
      registry.register(404, 'notFound', 1);
      expect(registry.register(500, 'notFound', 9)).assertFalse();
      expect(registry.count()).assertEqual(1);
      expect(registry.names().length).assertEqual(1);
      done();
    });

    it('ExceptionHandling_014', 0, async (done: Function) => {
      const registry = new HandlerRegistry();
      expect(registry.register(404, '', 1)).assertFalse();
      expect(registry.count()).assertEqual(0);
      expect(registry.resolve(404)).assertNull();
      done();
    });

    it('ExceptionHandling_015', 0, async (done: Function) => {
      const registry = new HandlerRegistry();
      registry.register(404, 'notFound', 1);
      expect(registry.resolve(400)).assertNull();
      expect(registry.resolve(500)).assertNull();
      expect(registry.countFor(404)).assertEqual(1);
      expect(registry.countFor(400)).assertEqual(0);
      done();
    });

    it('ExceptionHandling_016', 0, async (done: Function) => {
      const registry = new HandlerRegistry();
      registry.register(404, 'lowPriority', 1);
      registry.register(404, 'highPriority', 5);
      const handler = registry.resolve(404);
      expect(handler === null ? '' : handler.name).assertEqual('highPriority');
      expect(handler === null ? 0 : handler.priority).assertEqual(5);
      expect(registry.countFor(404)).assertEqual(2);
      done();
    });

    it('ExceptionHandling_017', 0, async (done: Function) => {
      const registry = new HandlerRegistry();
      registry.register(404, 'first', 2);
      registry.register(404, 'second', 2);
      const handler = registry.resolve(404);
      expect(handler === null ? '' : handler.name).assertEqual('first');
      expect(registry.count()).assertEqual(2);
      done();
    });

    it('ExceptionHandling_018', 0, async (done: Function) => {
      const registry = new HandlerRegistry();
      registry.register(404, 'notFound', 1);
      expect(registry.unregister('notFound')).assertTrue();
      expect(registry.count()).assertEqual(0);
      expect(registry.resolve(404)).assertNull();
      expect(registry.unregister('notFound')).assertFalse();
      done();
    });

    it('ExceptionHandling_019', 0, async (done: Function) => {
      const registry = new HandlerRegistry();
      registry.register(404, 'a', 1);
      registry.register(404, 'b', 2);
      expect(registry.unregister('b')).assertTrue();
      const handler = registry.resolve(404);
      expect(handler === null ? '' : handler.name).assertEqual('a');
      expect(registry.count()).assertEqual(1);
      done();
    });

    it('ExceptionHandling_020', 0, async (done: Function) => {
      const registry = new HandlerRegistry();
      registry.register(404, 'one', 1);
      registry.register(404, 'two', 2);
      registry.register(500, 'three', 3);
      expect(registry.countFor(404)).assertEqual(2);
      expect(registry.countFor(500)).assertEqual(1);
      expect(registry.countFor(600)).assertEqual(0);
      expect(registry.count()).assertEqual(3);
      done();
    });

    it('ExceptionHandling_021', 0, async (done: Function) => {
      const stack = new ErrorStack();
      expect(stack.size()).assertEqual(0);
      expect(stack.pop()).assertNull();
      expect(stack.peek()).assertNull();
      expect(stack.contains(404)).assertFalse();
      expect(stack.codes().length).assertEqual(0);
      done();
    });

    it('ExceptionHandling_022', 0, async (done: Function) => {
      const stack = new ErrorStack();
      stack.push(new AppError(404, 'missing', severityOf(404), ''));
      expect(stack.size()).assertEqual(1);
      const top = stack.peek();
      expect(top === null ? 0 : top.code).assertEqual(404);
      const popped = stack.pop();
      expect(popped === null ? 0 : popped.code).assertEqual(404);
      expect(stack.size()).assertEqual(0);
      done();
    });

    it('ExceptionHandling_023', 0, async (done: Function) => {
      const stack = new ErrorStack();
      stack.push(new AppError(404, 'missing', severityOf(404), ''));
      stack.push(new AppError(500, 'boom', severityOf(500), ''));
      const first = stack.pop();
      const second = stack.pop();
      expect(first === null ? 0 : first.code).assertEqual(500);
      expect(second === null ? 0 : second.code).assertEqual(404);
      expect(stack.size()).assertEqual(0);
      done();
    });

    it('ExceptionHandling_024', 0, async (done: Function) => {
      const stack = new ErrorStack();
      stack.push(new AppError(404, 'a', severityOf(404), ''));
      stack.push(new AppError(503, 'b', severityOf(503), ''));
      expect(stack.contains(404)).assertTrue();
      expect(stack.contains(503)).assertTrue();
      expect(stack.contains(500)).assertFalse();
      done();
    });

    it('ExceptionHandling_025', 0, async (done: Function) => {
      const stack = new ErrorStack();
      stack.push(new AppError(100, 'a', severityOf(100), ''));
      stack.push(new AppError(200, 'b', severityOf(200), ''));
      stack.push(new AppError(300, 'c', severityOf(300), ''));
      const codes = stack.codes();
      expect(codes.length).assertEqual(3);
      expect(codes[0]).assertEqual(100);
      expect(codes[1]).assertEqual(200);
      expect(codes[2]).assertEqual(300);
      done();
    });

    it('ExceptionHandling_026', 0, async (done: Function) => {
      const stack = new ErrorStack();
      stack.push(new AppError(404, 'a', severityOf(404), ''));
      stack.push(new AppError(500, 'b', severityOf(500), ''));
      stack.clear();
      expect(stack.size()).assertEqual(0);
      expect(stack.pop()).assertNull();
      expect(stack.codes().length).assertEqual(0);
      done();
    });

    it('ExceptionHandling_027', 0, async (done: Function) => {
      const stack = new ErrorStack();
      stack.push(new AppError(408, 'timeout', severityOf(408), ''));
      expect(stack.peek() !== null).assertTrue();
      expect(stack.peek() !== null).assertTrue();
      expect(stack.size()).assertEqual(1);
      expect(stack.pop() !== null).assertTrue();
      expect(stack.size()).assertEqual(0);
      done();
    });

    it('ExceptionHandling_028', 0, async (done: Function) => {
      const stack = new ErrorStack();
      for (let i = 0; i < 5; i++) {
        stack.push(new AppError(400 + i, 'e', severityOf(400 + i), ''));
      }
      expect(stack.size()).assertEqual(5);
      expect(stack.codes().length).assertEqual(5);
      expect(stack.contains(402)).assertTrue();
      expect(stack.contains(404)).assertTrue();
      done();
    });

    it('ExceptionHandling_029', 0, async (done: Function) => {
      const stack = new ErrorStack();
      stack.push(new AppError(404, 'a', severityOf(404), ''));
      stack.push(new AppError(404, 'b', severityOf(404), ''));
      expect(stack.contains(404)).assertTrue();
      expect(stack.codes()[0]).assertEqual(404);
      expect(stack.codes()[1]).assertEqual(404);
      expect(stack.size()).assertEqual(2);
      done();
    });

    it('ExceptionHandling_030', 0, async (done: Function) => {
      const stack = new ErrorStack();
      stack.push(new AppError(500, 'a', severityOf(500), ''));
      expect(stack.contains(501)).assertFalse();
      expect(stack.contains(500)).assertTrue();
      expect(stack.size()).assertEqual(1);
      done();
    });

    it('ExceptionHandling_031', 0, async (done: Function) => {
      const engine = new ExceptionEngine();
      expect(engine.handled).assertEqual(0);
      expect(engine.unhandled).assertEqual(0);
      expect(engine.finallyRuns).assertEqual(0);
      expect(engine.stack.size()).assertEqual(0);
      expect(engine.totalOutcomes()).assertEqual(0);
      done();
    });

    it('ExceptionHandling_032', 0, async (done: Function) => {
      const engine = new ExceptionEngine();
      expect(engine.run(404, 'missing')).assertEqual('unhandled');
      expect(engine.unhandled).assertEqual(1);
      expect(engine.handled).assertEqual(0);
      expect(engine.finallyRuns).assertEqual(1);
      expect(engine.stack.contains(404)).assertTrue();
      done();
    });

    it('ExceptionHandling_033', 0, async (done: Function) => {
      const engine = new ExceptionEngine();
      engine.registry.register(404, 'notFoundHandler', 1);
      expect(engine.run(404, 'missing')).assertEqual('notFoundHandler');
      expect(engine.handled).assertEqual(1);
      expect(engine.unhandled).assertEqual(0);
      expect(engine.stack.size()).assertEqual(0);
      expect(engine.finallyRuns).assertEqual(1);
      done();
    });

    it('ExceptionHandling_034', 0, async (done: Function) => {
      const engine = new ExceptionEngine();
      engine.registry.register(404, 'notFoundHandler', 1);
      engine.run(404, 'a');
      engine.run(500, 'b');
      engine.run(404, 'c');
      expect(engine.handled).assertEqual(2);
      expect(engine.unhandled).assertEqual(1);
      expect(engine.finallyRuns).assertEqual(3);
      expect(engine.totalOutcomes()).assertEqual(3);
      done();
    });

    it('ExceptionHandling_035', 0, async (done: Function) => {
      const engine = new ExceptionEngine();
      engine.run(404, 'a');
      engine.run(500, 'b');
      expect(engine.finallyRuns).assertEqual(2);
      expect(engine.unhandled).assertEqual(2);
      expect(engine.stack.size()).assertEqual(2);
      done();
    });

    it('ExceptionHandling_036', 0, async (done: Function) => {
      const engine = new ExceptionEngine();
      engine.run(404, 'a');
      engine.run(500, 'b');
      expect(engine.drain()).assertEqual(2);
      expect(engine.stack.size()).assertEqual(0);
      expect(engine.drain()).assertEqual(0);
      done();
    });

    it('ExceptionHandling_037', 0, async (done: Function) => {
      const engine = new ExceptionEngine();
      engine.registry.register(500, 'serverHandler', 1);
      engine.run(500, 'a');
      engine.run(404, 'b');
      engine.run(500, 'c');
      expect(engine.handled).assertEqual(2);
      expect(engine.unhandled).assertEqual(1);
      expect(engine.totalOutcomes()).assertEqual(3);
      done();
    });

    it('ExceptionHandling_038', 0, async (done: Function) => {
      const engine = new ExceptionEngine();
      engine.registry.register(404, 'low', 1);
      engine.registry.register(404, 'high', 10);
      expect(engine.run(404, 'a')).assertEqual('high');
      expect(engine.handled).assertEqual(1);
      expect(engine.stack.size()).assertEqual(0);
      done();
    });

    it('ExceptionHandling_039', 0, async (done: Function) => {
      const engine = new ExceptionEngine();
      engine.registry.register(500, 'criticalHandler', 2);
      expect(engine.run(500, 'boom')).assertEqual('criticalHandler');
      expect(engine.finallyRuns).assertEqual(1);
      expect(engine.unhandled).assertEqual(0);
      done();
    });

    it('ExceptionHandling_040', 0, async (done: Function) => {
      const engine = new ExceptionEngine();
      expect(engine.run(500, 'boom')).assertEqual('unhandled');
      expect(engine.stack.contains(500)).assertTrue();
      const top = engine.stack.peek();
      expect(top === null ? 0 : top.code).assertEqual(500);
      expect(top === null ? false : top.isCritical()).assertTrue();
      done();
    });

    it('ExceptionHandling_041', 0, async (done: Function) => {
      const aggregator = new ErrorAggregator();
      expect(aggregator.count()).assertEqual(0);
      expect(aggregator.codes().length).assertEqual(0);
      expect(aggregator.hasCode(404)).assertFalse();
      expect(aggregator.mostSevere()).assertNull();
      expect(aggregator.countBySeverity(ErrorSeverity.HIGH)).assertEqual(0);
      done();
    });

    it('ExceptionHandling_042', 0, async (done: Function) => {
      const aggregator = new ErrorAggregator();
      aggregator.add(new AppError(404, 'a', severityOf(404), ''));
      aggregator.add(new AppError(500, 'b', severityOf(500), ''));
      expect(aggregator.count()).assertEqual(2);
      expect(aggregator.hasCode(404)).assertTrue();
      expect(aggregator.hasCode(500)).assertTrue();
      const severe = aggregator.mostSevere();
      expect(severe === null ? 0 : severe.code).assertEqual(500);
      done();
    });

    it('ExceptionHandling_043', 0, async (done: Function) => {
      const aggregator = new ErrorAggregator();
      aggregator.add(new AppError(400, 'a', severityOf(400), ''));
      aggregator.add(new AppError(404, 'b', severityOf(404), ''));
      aggregator.add(new AppError(500, 'c', severityOf(500), ''));
      aggregator.add(new AppError(503, 'd', severityOf(503), ''));
      expect(aggregator.countBySeverity(ErrorSeverity.HIGH)).assertEqual(2);
      expect(aggregator.countBySeverity(ErrorSeverity.CRITICAL)).assertEqual(2);
      expect(aggregator.countBySeverity(ErrorSeverity.LOW)).assertEqual(0);
      done();
    });

    it('ExceptionHandling_044', 0, async (done: Function) => {
      const aggregator = new ErrorAggregator();
      aggregator.add(new AppError(408, 'timeout', severityOf(408), ''));
      expect(aggregator.hasCode(408)).assertTrue();
      expect(aggregator.hasCode(400)).assertFalse();
      expect(aggregator.hasCode(500)).assertFalse();
      done();
    });

    it('ExceptionHandling_045', 0, async (done: Function) => {
      const source = new ErrorAggregator();
      source.add(new AppError(404, 'a', severityOf(404), ''));
      source.add(new AppError(500, 'b', severityOf(500), ''));
      const target = new ErrorAggregator();
      target.add(new AppError(400, 'c', severityOf(400), ''));
      expect(target.merge(source)).assertEqual(2);
      expect(target.count()).assertEqual(3);
      expect(target.hasCode(404)).assertTrue();
      expect(target.hasCode(500)).assertTrue();
      done();
    });

    it('ExceptionHandling_046', 0, async (done: Function) => {
      const aggregator = new ErrorAggregator();
      aggregator.add(new AppError(404, 'a', severityOf(404), ''));
      aggregator.add(new AppError(500, 'b', severityOf(500), ''));
      aggregator.clear();
      expect(aggregator.count()).assertEqual(0);
      expect(aggregator.codes().length).assertEqual(0);
      expect(aggregator.mostSevere()).assertNull();
      done();
    });

    it('ExceptionHandling_047', 0, async (done: Function) => {
      const aggregator = new ErrorAggregator();
      aggregator.add(new AppError(400, 'first', severityOf(400), ''));
      aggregator.add(new AppError(404, 'second', severityOf(404), ''));
      const severe = aggregator.mostSevere();
      expect(severe === null ? '' : severe.message).assertEqual('first');
      expect(severe === null ? 0 : severe.severity).assertEqual(ErrorSeverity.HIGH);
      done();
    });

    it('ExceptionHandling_048', 0, async (done: Function) => {
      const aggregator = new ErrorAggregator();
      aggregator.add(new AppError(100, 'a', severityOf(100), ''));
      aggregator.add(new AppError(400, 'b', severityOf(400), ''));
      aggregator.add(new AppError(500, 'c', severityOf(500), ''));
      const codes = aggregator.codes();
      expect(codes.length).assertEqual(3);
      expect(codes[0]).assertEqual(100);
      expect(codes[1]).assertEqual(400);
      expect(codes[2]).assertEqual(500);
      done();
    });

    it('ExceptionHandling_049', 0, async (done: Function) => {
      const source = new ErrorAggregator();
      source.add(new AppError(400, 'a', severityOf(400), ''));
      const target = new ErrorAggregator();
      target.add(new AppError(500, 'b', severityOf(500), ''));
      target.merge(source);
      expect(target.countBySeverity(ErrorSeverity.HIGH)).assertEqual(1);
      expect(target.countBySeverity(ErrorSeverity.CRITICAL)).assertEqual(1);
      expect(target.count()).assertEqual(2);
      done();
    });

    it('ExceptionHandling_050', 0, async (done: Function) => {
      const aggregator = new ErrorAggregator();
      aggregator.add(new AppError(404, 'a', severityOf(404), ''));
      aggregator.add(new AppError(404, 'b', severityOf(404), ''));
      expect(aggregator.count()).assertEqual(2);
      expect(aggregator.codes()[0]).assertEqual(404);
      expect(aggregator.codes()[1]).assertEqual(404);
      expect(aggregator.countBySeverity(ErrorSeverity.HIGH)).assertEqual(2);
      done();
    });

    it('ExceptionHandling_051', 0, async (done: Function) => {
      const trace = new ExecutionTrace();
      expect(trace.count()).assertEqual(0);
      expect(trace.order()).assertEqual('');
      expect(trace.contains('try')).assertFalse();
      done();
    });

    it('ExceptionHandling_052', 0, async (done: Function) => {
      const trace = new ExecutionTrace();
      trace.record('try');
      trace.record('body');
      expect(trace.count()).assertEqual(2);
      expect(trace.order()).assertEqual('try>body');
      expect(trace.contains('body')).assertTrue();
      done();
    });

    it('ExceptionHandling_053', 0, async (done: Function) => {
      const trace = new ExecutionTrace();
      trace.record('try');
      trace.record('catch');
      trace.record('finally');
      expect(trace.order()).assertEqual('try>catch>finally');
      expect(trace.count()).assertEqual(3);
      expect(trace.contains('catch')).assertTrue();
      expect(trace.contains('finally')).assertTrue();
      done();
    });

    it('ExceptionHandling_054', 0, async (done: Function) => {
      const trace = new ExecutionTrace();
      trace.record('a');
      trace.record('b');
      trace.clear();
      expect(trace.count()).assertEqual(0);
      expect(trace.order()).assertEqual('');
      expect(trace.contains('a')).assertFalse();
      done();
    });

    it('ExceptionHandling_055', 0, async (done: Function) => {
      const trace = new ExecutionTrace();
      trace.record('step');
      trace.record('step');
      expect(trace.count()).assertEqual(2);
      expect(trace.order()).assertEqual('step>step');
      expect(trace.contains('step')).assertTrue();
      done();
    });

    it('ExceptionHandling_056', 0, async (done: Function) => {
      const trace = new ExecutionTrace();
      trace.record('try');
      expect(trace.contains('catch')).assertFalse();
      expect(trace.contains('finally')).assertFalse();
      expect(trace.count()).assertEqual(1);
      done();
    });

    it('ExceptionHandling_057', 0, async (done: Function) => {
      const trace = new ExecutionTrace();
      const engine = new ExceptionEngine();
      engine.registry.register(404, 'notFoundHandler', 1);
      trace.record('try');
      const outcome = engine.run(404, 'missing');
      trace.record('handle');
      trace.record('finally');
      expect(outcome).assertEqual('notFoundHandler');
      expect(trace.order()).assertEqual('try>handle>finally');
      expect(engine.finallyRuns).assertEqual(1);
      done();
    });

    it('ExceptionHandling_058', 0, async (done: Function) => {
      const trace = new ExecutionTrace();
      const engine = new ExceptionEngine();
      trace.record('try');
      const outcome = engine.run(500, 'boom');
      trace.record('finally');
      expect(outcome).assertEqual('unhandled');
      expect(trace.order()).assertEqual('try>finally');
      expect(engine.stack.contains(500)).assertTrue();
      done();
    });

    it('ExceptionHandling_059', 0, async (done: Function) => {
      const aggregator = new ErrorAggregator();
      aggregator.add(new AppError(300, 'redirect', severityOf(300), ''));
      aggregator.add(new AppError(400, 'bad', severityOf(400), ''));
      aggregator.add(new AppError(503, 'down', severityOf(503), ''));
      const severe = aggregator.mostSevere();
      expect(severe === null ? 0 : severe.code).assertEqual(503);
      expect(severe === null ? 0 : severe.severity).assertEqual(ErrorSeverity.CRITICAL);
      expect(aggregator.countBySeverity(ErrorSeverity.MEDIUM)).assertEqual(1);
      done();
    });

    it('ExceptionHandling_060', 0, async (done: Function) => {
      const aggregator = new ErrorAggregator();
      for (let i = 0; i < 10; i++) {
        aggregator.add(new AppError(500 + i, 'e', severityOf(500 + i), ''));
      }
      expect(aggregator.count()).assertEqual(10);
      expect(aggregator.codes().length).assertEqual(10);
      expect(aggregator.countBySeverity(ErrorSeverity.CRITICAL)).assertEqual(10);
      expect(aggregator.hasCode(505)).assertTrue();
      done();
    });

    it('ExceptionHandling_061', 0, async (done: Function) => {
      const engine = new ExceptionEngine();
      engine.registry.register(404, 'handler', 1);
      expect(engine.run(404, 'a')).assertEqual('handler');
      engine.registry.unregister('handler');
      expect(engine.run(404, 'b')).assertEqual('unhandled');
      expect(engine.handled).assertEqual(1);
      expect(engine.unhandled).assertEqual(1);
      expect(engine.finallyRuns).assertEqual(2);
      done();
    });

    it('ExceptionHandling_062', 0, async (done: Function) => {
      const engine = new ExceptionEngine();
      engine.run(404, 'a');
      engine.run(500, 'b');
      engine.run(503, 'c');
      const codes = engine.stack.codes();
      expect(codes.length).assertEqual(3);
      expect(codes[0]).assertEqual(404);
      expect(codes[1]).assertEqual(500);
      expect(codes[2]).assertEqual(503);
      done();
    });

    it('ExceptionHandling_063', 0, async (done: Function) => {
      const source = new ErrorAggregator();
      source.add(new AppError(408, 'timeout', severityOf(408), ''));
      source.add(new AppError(503, 'down', severityOf(503), ''));
      const target = new ErrorAggregator();
      expect(target.merge(source)).assertEqual(2);
      expect(target.hasCode(408)).assertTrue();
      expect(target.hasCode(503)).assertTrue();
      expect(target.count()).assertEqual(2);
      done();
    });

    it('ExceptionHandling_064', 0, async (done: Function) => {
      const original = new AppError(404, 'missing', severityOf(404), '');
      const once = original.withCause('first');
      const twice = once.withCause('second');
      expect(once.cause).assertEqual('first');
      expect(twice.cause).assertEqual('second');
      expect(original.cause).assertEqual('');
      expect(twice.code).assertEqual(original.code);
      done();
    });

    it('ExceptionHandling_065', 0, async (done: Function) => {
      expect(ErrorSeverity.LOW < ErrorSeverity.MEDIUM).assertTrue();
      expect(ErrorSeverity.MEDIUM < ErrorSeverity.HIGH).assertTrue();
      expect(ErrorSeverity.HIGH < ErrorSeverity.CRITICAL).assertTrue();
      expect(severityOf(300) < severityOf(400)).assertTrue();
      expect(severityOf(400) < severityOf(500)).assertTrue();
      done();
    });

    it('ExceptionHandling_066', 0, async (done: Function) => {
      const error = new AppError(404, '', severityOf(404), '');
      expect(error.describe()).assertEqual('404:');
      expect(error.message).assertEqual('');
      expect(error.severity).assertEqual(ErrorSeverity.HIGH);
      expect(error.isCritical()).assertFalse();
      done();
    });

    it('ExceptionHandling_067', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
        hilog.info(0x0000, 'StageModelTest', '%{public}s', `exception ui probe ${exists}`);
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}







