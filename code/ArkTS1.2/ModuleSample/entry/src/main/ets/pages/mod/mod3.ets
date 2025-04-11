import hilog from '@ohos.hilog'
export class A {
  static count = 1;
  static {
    hilog.info(0x0000, 'testTag', 'executeModule execute A');
  }
}
A.count = 101;
export class B {
  static count = 0;
  static {
    B.count = ++A.count;
    hilog.info(0x0000, 'testTag', 'executeModule execute B');
  }
}
export class C {
  static count = 0;
  static {
    C.count = ++A.count;
    hilog.info(0x0000, 'testTag', 'executeModule execute C');
  }
}
export class D {
  static count = 0;
  static {
    D.count = ++A.count;
    hilog.info(0x0000, 'testTag', 'executeModule execute D');
  }
}
export class E {
  static count = 0;
  static {
    E.count = ++A.count;
    hilog.info(0x0000, 'testTag', 'executeModule execute E');
  }
}