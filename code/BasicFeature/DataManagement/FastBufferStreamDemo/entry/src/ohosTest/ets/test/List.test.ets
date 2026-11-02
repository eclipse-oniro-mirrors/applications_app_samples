import abilityTest from './Ability.test';
import fastBufferBasicsTest from './FastBufferBasics.test';
import fastBufferMatrixTest from './FastBufferMatrix.test';
import streamPipelineTest from './StreamPipeline.test';
import fastBufferUtilTest from './FastBufferUtil.test';
import fastBufferUtilMatrixTest from './FastBufferUtilMatrix.test';
import streamFileUtilTest from './StreamFileUtil.test';
import streamFileMatrixTest from './StreamFileMatrix.test';
import perfTimerTest from './PerfTimer.test';
import perfTimerMatrixTest from './PerfTimerMatrix.test';
import deviceUtilTest from './DeviceUtil.test';
import deviceUtilMatrixTest from './DeviceUtilMatrix.test';
import logUtilTest from './LogUtil.test';
import logUtilMatrixTest from './LogUtilMatrix.test';
import tlvUtilTest from './TlvUtil.test';
import tlvMatrixTest from './TlvMatrix.test';

export default function testsuite() {
  abilityTest();
  fastBufferBasicsTest();
  fastBufferMatrixTest();
  fastBufferUtilTest();
  fastBufferUtilMatrixTest();
  streamFileUtilTest();
  streamFileMatrixTest();
  perfTimerTest();
  perfTimerMatrixTest();
  deviceUtilTest();
  deviceUtilMatrixTest();
  logUtilTest();
  logUtilMatrixTest();
  streamPipelineTest();
  tlvUtilTest();
  tlvMatrixTest();
}
