require 'BatchBRNN'
------------------------------------------------------------------------
--[[ BatchBRNNReLU ]] --
-- Based On BatchBRNN. Adds ClippedReLU non-linearity to Vanilla BRNN.
------------------------------------------------------------------------
local BatchBRNNReLU, parent = torch.class('cudnn.BatchBRNNReLU', 'cudnn.BatchBRNN')

function BatchBRNNReLU:__init(inputDim, outputDim)
    parent.__init(self, inputDim, outputDim)
    local rnn = self.rnn
    rnn.mode = 'CUDNN_RNN_RELU'
    rnn:reset()
    self:insert(nn.Clamp(0, 20), 6)
end