
Å
Abort"U
	error_msgstring "<A string which is the message associated with the exception."
exit_without_errorbool( *”Raise a exception to abort the process when called. If exit_without_error is true, the process will exit normally, otherwise it will exit with a SIGABORT signal.2!Returns nothing but an exception.
Ŗ
Abs
x"T
y"T"
Ttype:	
2	*(Computes the absolute value of a tensor.2ŅGiven a tensor `x`, this operation returns a tensor containing the absolute
value of each element in `x`. For example, if x is an input element and y is
an output element, this operation computes \\(y = |x|\\).
Ē
AccumulatorApplyGradient+
handleThe handle to a accumulator.H

local_step8The local_step value at which the gradient was computed.	>
gradient+A tensor of the gradient to be accumulated."dtype"~
dtypetype"[The data type of accumulated gradients. Needs to correspond to the type
of the accumulator.:
2	*OApplies a gradient to a given accumulator. Does not add if local_step is lesser2#than the accumulator's global_step.
ć
AccumulatorNumAccumulated,
handleThe handle to an accumulator.Q
num_accumulated<The number of gradients aggregated in the given accumulator.*EReturns the number of gradients aggregated in the given accumulators.

AccumulatorSetGlobalStep,
handleThe handle to an accumulator.6
new_global_step!The new global_step value to set.	*MUpdates the accumulator with a new value for global_step. Logs warning if the2;accumulator's value is already higher than new_global_step.
¢
AccumulatorTakeGradient,
handleThe handle to an accumulator.M
num_required;Number of gradients required before we return an aggregate.;
average)The average of the accumulated gradients."dtype"~
dtypetype"[The data type of accumulated gradients. Needs to correspond to the type
of the accumulator.:
2	*KExtracts the average gradient in the given ConditionalAccumulator, provided2’that sufficient (i.e., more than num_required) gradients have been accumulated.
The op blocks until sufficient gradients have been accumulated.
If the accumulator has already aggregated more than num_required gradients, it
returns the average of the accumulated gradients.
Also automatically increments the recorded global_step in the accumulator by 1,
and resets the aggregate to 0.
P
Acos
x"T
y"T"
Ttype:
	2	* Computes acos of x element-wise.
ģ
Add
x"T
y"T
z"T"
Ttype:
2	*Returns x + y element-wise.2*NOTE*: `Add` supports broadcasting. `AddN` does not. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)
Ū
AddManySparseToTensorsMap
sparse_indiceso2-D.  The `indices` of the minibatch `SparseTensor`.
`sparse_indices[:, 0]` must be ordered values in `[0, N)`.	G
sparse_values31-D.  The `values` of the minibatch `SparseTensor`."To
sparse_shape]1-D.  The `shape` of the minibatch `SparseTensor`.
The minibatch size `N == sparse_shape[0]`.	p
sparse_handles\1-D.  The handles of the `SparseTensor` now stored in the
`SparseTensorsMap`.  Shape: `[N]`.	"	
Ttype"Z
	containerstring "AThe container name for the `SparseTensorsMap` created by this op."
shared_namestring "qThe shared name for the `SparseTensorsMap` created by this op.
If blank, the new Operation's unique name is used.*PAdd an `N`-minibatch `SparseTensor` to a `SparseTensorsMap`, return `N` handles.2Ą	A `SparseTensor` of rank `R` is represented by three tensors: `sparse_indices`,
`sparse_values`, and `sparse_shape`, where

```sparse_indices.shape[1] == sparse_shape.shape[0] == R```

An `N`-minibatch of `SparseTensor` objects is represented as a `SparseTensor`
having a first `sparse_indices` column taking values between `[0, N)`, where
the minibatch size `N == sparse_shape[0]`.

The input `SparseTensor` must have rank `R` greater than 1, and the first
dimension is treated as the minibatch dimension.  Elements of the `SparseTensor`
must be sorted in increasing order of this first dimension.  The stored
`SparseTensor` objects pointed to by each row of the output `sparse_handles`
will have rank `R-1`.

The `SparseTensor` values can then be read out as part of a minibatch by passing
the given keys as vector elements to `TakeManySparseFromTensorsMap`.  To ensure
the correct `SparseTensorsMap` is accessed, ensure that the same
`container` and `shared_name` are passed to that Op.  If no `shared_name`
is provided here, instead use the *name* of the Operation created by calling
`AddManySparseToTensorsMap` as the `shared_name` passed to
`TakeManySparseFromTensorsMap`.  Ensure the Operations are colocated.

AddN4
inputs$Must all be the same size and shape."T*N
sum"T"
Nint(0"
Ttype:
2	*#Add all input tensors element wise.

AddSparseToTensorsMap>
sparse_indices*2-D.  The `indices` of the `SparseTensor`.	=
sparse_values)1-D.  The `values` of the `SparseTensor`."T:
sparse_shape(1-D.  The `shape` of the `SparseTensor`.	_
sparse_handleL0-D.  The handle of the `SparseTensor` now stored in the
`SparseTensorsMap`.	"	
Ttype"Z
	containerstring "AThe container name for the `SparseTensorsMap` created by this op."
shared_namestring "qThe shared name for the `SparseTensorsMap` created by this op.
If blank, the new Operation's unique name is used.*?Add a `SparseTensor` to a `SparseTensorsMap` return its handle.2®A `SparseTensor` is represented by three tensors: `sparse_indices`,
`sparse_values`, and `sparse_shape`.

This operator takes the given `SparseTensor` and adds it to a container
object (a `SparseTensorsMap`).  A unique key within this container is generated
in the form of an `int64`, and this is the value that is returned.

The `SparseTensor` can then be read out as part of a minibatch by passing
the key as a vector element to `TakeManySparseFromTensorsMap`.  To ensure
the correct `SparseTensorsMap` is accessed, ensure that the same
`container` and `shared_name` are passed to that Op.  If no `shared_name`
is provided here, instead use the *name* of the Operation created by calling
`AddSparseToTensorsMap` as the `shared_name` passed to
`TakeManySparseFromTensorsMap`.  Ensure the Operations are colocated.
Č
AdjustContrast
images"T
contrast_factor
	min_value
	max_value

output"
Ttype:
	2	*0Deprecated. Disallowed in GraphDef version >= 2.B Use AdjustContrastv2 instead
³
AdjustContrastv2,
images Images to adjust.  At least 3-D.?
contrast_factor*A float multiplier for adjusting contrast.2
output&The contrast-adjusted image or images.**Adjust the contrast of one or more images.2Ļ`images` is a tensor of at least 3 dimensions.  The last 3 dimensions are
interpreted as `[height, width, channels]`.  The other dimensions only
represent a collection of images, such as `[batch, height, width, channels].`

Contrast is adjusted independently for each channel of each image.

For each channel, the Op first computes the mean of the image pixels in the
channel and then adjusts each component of each pixel to
`(x - mean) * contrast_factor + mean`.
õ
	AdjustHue,
images Images to adjust.  At least 3-D.+
delta A float delta to add to the hue.-
output!The hue-adjusted image or images.*%Adjust the hue of one or more images.2¶`images` is a tensor of at least 3 dimensions.  The last dimension is
interpretted as channels, and must be three.

The input image is considered in the RGB colorspace. Conceptually, the RGB
colors are first mapped into HSV. A delta is then applied all the hue values,
and then remapped back to RGB colorspace.

AdjustSaturation,
images Images to adjust.  At least 3-D.2
scale'A float scale to add to the saturation.-
output!The hue-adjusted image or images.*,Adjust the saturation of one or more images.2½`images` is a tensor of at least 3 dimensions.  The last dimension is
interpretted as channels, and must be three.

The input image is considered in the RGB colorspace. Conceptually, the RGB
colors are first mapped into HSV. A scale is then applied all the saturation
values, and then remapped back to RGB colorspace.
£
All 
inputThe tensor to reduce.
4
reduction_indicesThe dimensions to reduce."Tidx
outputThe reduced tensor.
"H
	keep_dimsbool( "1If true, retain reduced dimensions with length 1."
Tidxtype0:
2	*EComputes the "logical and" of elements across dimensions of a tensor.2÷Reduces `input` along the dimensions given in `reduction_indices`. Unless
`keep_dims` is true, the rank of the tensor is reduced by 1 for each entry in
`reduction_indices`. If `keep_dims` is true, the reduced dimensions are
retained with length 1.
ķ
AllCandidateSampler
true_classesA batch_size * num_true matrix, in which each row contains the
IDs of the num_true target_classes in the corresponding original label.	o
sampled_candidatesWA vector of length num_sampled, in which each element is
the ID of a sampled candidate.	Ģ
true_expected_count²A batch_size * num_true matrix, representing
the number of times each candidate is expected to occur in a batch
of sampled candidates. If unique=true, then this is a probability.ź
sampled_expected_countĶA vector of length num_sampled, for each sampled
candidate representing the number of times the candidate is expected
to occur in a batch of sampled candidates.  If unique=true, then this is a
probability."7
num_trueint""Number of true labels per context.(0"B
num_sampledint"*Number of candidates to produce per batch.(0"Ė
uniquebool"ŗIf unique is true, we sample with rejection, so that all sampled
candidates in a batch are unique. This requires some approximation to
estimate the post-rejection sampling probabilities."„
seedint "If either seed or seed2 are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."9
seed2int "'An second seed to avoid seed collision.*LGenerates labels for candidate sampling with a learned unigram distribution.2See explanations of candidate sampling and the data formats at
go/candidate-sampling.

For each batch, this op picks a single set of sampled candidate labels.

The advantages of sampling candidates per-batch are simplicity and the
possibility of efficient dense matrix multiplication. The disadvantage is that
the sampled candidates must be chosen independently of the context and of the
true labels.
¢
Any 
inputThe tensor to reduce.
4
reduction_indicesThe dimensions to reduce."Tidx
outputThe reduced tensor.
"H
	keep_dimsbool( "1If true, retain reduced dimensions with length 1."
Tidxtype0:
2	*DComputes the "logical or" of elements across dimensions of a tensor.2÷Reduces `input` along the dimensions given in `reduction_indices`. Unless
`keep_dims` is true, the rank of the tensor is reduced by 1 for each entry in
`reduction_indices`. If `keep_dims` is true, the reduced dimensions are
retained with length 1.
Į
ApplyAdadelta)
varShould be from a Variable()."T+
accumShould be from a Variable()."T2
accum_updateShould be from a Variable()."T*
lr!Scaling factor. Must be a scalar."T)
rhoDecay factor. Must be a scalar."T0
epsilon"Constant factor. Must be a scalar."T
gradThe gradient."T
outSame as "var"."T"
Ttype:
2	"¹
use_lockingbool( "If True, updating of the var, accum and update_accum tensors will be protected by
a lock; otherwise the behavior is undefined, but may exhibit less contention.*/Update '*var' according to the adadelta scheme.2×accum = rho() * accum + (1 - rho()) * grad.square();
update = (update_accum + epsilon).sqrt() * (accum + epsilon()).rsqrt() * grad;
update_accum = rho() * update_accum + (1 - rho()) * update.square();
var -= update;

ApplyAdagrad)
varShould be from a Variable()."T+
accumShould be from a Variable()."T*
lr!Scaling factor. Must be a scalar."T
gradThe gradient."T
outSame as "var"."T"
Ttype:
2	"­
use_lockingbool( "If `True`, updating of the var and accum tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*.Update '*var' according to the adagrad scheme.29accum += grad * grad
var -= lr * grad * (1 / sqrt(accum))
¼
ApplyAdagradDA)
varShould be from a Variable()."T:
gradient_accumulatorShould be from a Variable()."TB
gradient_squared_accumulatorShould be from a Variable()."T
gradThe gradient."T*
lr!Scaling factor. Must be a scalar."T-
l1$L1 regularization. Must be a scalar."T-
l2$L2 regularization. Must be a scalar."T8
global_step'Training step number. Must be a scalar.	
outSame as "var"."T"
Ttype:
2	"«
use_lockingbool( "If True, updating of the var and accum tensors will be protected by
a lock; otherwise the behavior is undefined, but may exhibit less contention.*7Update '*var' according to the proximal adagrad scheme.

	ApplyAdam)
varShould be from a Variable()."T'
mShould be from a Variable()."T'
vShould be from a Variable()."T#
beta1_powerMust be a scalar."T#
beta2_powerMust be a scalar."T*
lr!Scaling factor. Must be a scalar."T.
beta1"Momentum factor. Must be a scalar."T.
beta2"Momentum factor. Must be a scalar."T+
epsilonRidge term. Must be a scalar."T
gradThe gradient."T
outSame as "var"."T"
Ttype:
2	"­
use_lockingbool( "If `True`, updating of the var, m, and v tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*.Update '*var' according to the Adam algorithm.2Ļlr_t <- learning_rate * sqrt(1 - beta2^t) / (1 - beta1^t)
m_t <- beta1 * m_{t-1} + (1 - beta1) * g_t
v_t <- beta2 * v_{t-1} + (1 - beta2) * g_t * g_t
variable <- variable - lr_t * m_t / (sqrt(v_t) + epsilon)

ApplyCenteredRMSProp)
varShould be from a Variable()."T(
mgShould be from a Variable()."T(
msShould be from a Variable()."T)
momShould be from a Variable()."T*
lr!Scaling factor. Must be a scalar."T'
rhoDecay rate. Must be a scalar."T
momentum"T+
epsilonRidge term. Must be a scalar."T
gradThe gradient."T
outSame as "var"."T"
Ttype:
2	"Æ
use_lockingbool( "If `True`, updating of the var, mg, ms, and mom tensors is
protected by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*:Update '*var' according to the centered RMSProp algorithm.2ļThe centered RMSProp algorithm uses an estimate of the centered second moment
(i.e., the variance) for normalization, as opposed to regular RMSProp, which
uses the (uncentered) second moment. This often helps with training, but is
slightly more expensive in terms of computation and memory.

Note that in dense implementation of this algorithm, mg, ms, and mom will
update even if the grad is zero, but in this sparse implementation, mg, ms,
and mom will not update in iterations during which the grad is zero.

mean_square = decay * mean_square + (1-decay) * gradient ** 2
mean_grad = decay * mean_grad + (1-decay) * gradient

Delta = learning_rate * gradient / sqrt(mean_square + epsilon - mean_grad ** 2)

mg <- rho * mg_{t-1} + (1-rho) * grad
ms <- rho * ms_{t-1} + (1-rho) * grad * grad
mom <- momentum * mom_{t-1} + lr * grad / sqrt(ms - mg * mg + epsilon)
var <- var - mom

	ApplyFtrl)
varShould be from a Variable()."T+
accumShould be from a Variable()."T,
linearShould be from a Variable()."T
gradThe gradient."T*
lr!Scaling factor. Must be a scalar."T,
l1#L1 regulariation. Must be a scalar."T,
l2#L2 regulariation. Must be a scalar."T0
lr_power!Scaling factor. Must be a scalar."T
outSame as "var"."T"
Ttype:
2	"­
use_lockingbool( "If `True`, updating of the var and accum tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*4Update '*var' according to the Ftrl-proximal scheme.2łaccum_new = accum + grad * grad
linear += grad + (accum_new^(-lr_power) - accum^(-lr_power)) / lr * var
quadratic = 1.0 / (accum_new^(lr_power) * lr) + 2 * l2
var = (sign(linear) * l1 - linear) / quadratic if |linear| > l1 else 0.0
accum = accum_new

ApplyGradientDescent)
varShould be from a Variable()."T-
alpha!Scaling factor. Must be a scalar."T
deltaThe change."T
outSame as "var"."T"
Ttype:
2	"
use_lockingbool( "}If `True`, the subtraction will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*7Update '*var' by subtracting 'alpha' * 'delta' from it.

ApplyMomentum)
varShould be from a Variable()."T+
accumShould be from a Variable()."T*
lr!Scaling factor. Must be a scalar."T
gradThe gradient."T*
momentumMomentum. Must be a scalar."T
outSame as "var"."T"
Ttype:
2	"­
use_lockingbool( "If `True`, updating of the var and accum tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention."“
use_nesterovbool( "If `True`, the tensor passed to compute grad will be
var - lr * momentum * accum, so in the end, the var you get is actually
var - lr * momentum * accum.*NUpdate '*var' according to the momentum scheme. Set use_nesterov = True if you2Qwant to use Nesterov momentum.

accum = accum * momentum + grad
var -= lr * accum
æ
ApplyProximalAdagrad)
varShould be from a Variable()."T+
accumShould be from a Variable()."T*
lr!Scaling factor. Must be a scalar."T-
l1$L1 regularization. Must be a scalar."T-
l2$L2 regularization. Must be a scalar."T
gradThe gradient."T
outSame as "var"."T"
Ttype:
2	"«
use_lockingbool( "If True, updating of the var and accum tensors will be protected by
a lock; otherwise the behavior is undefined, but may exhibit less contention.*IUpdate '*var' and '*accum' according to FOBOS with Adagrad learning rate.2vaccum += grad * grad
prox_v = var - lr * grad * (1 / sqrt(accum))
var = sign(prox_v)/(1+lr*l2) * max{|prox_v|-lr*l1,0}
×
ApplyProximalGradientDescent)
varShould be from a Variable()."T-
alpha!Scaling factor. Must be a scalar."T-
l1$L1 regularization. Must be a scalar."T-
l2$L2 regularization. Must be a scalar."T
deltaThe change."T
outSame as "var"."T"
Ttype:
2	"
use_lockingbool( "{If True, the subtraction will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*:Update '*var' as FOBOS algorithm with fixed learning rate.2Wprox_v = var - alpha * delta
var = sign(prox_v)/(1+alpha*l2) * max{|prox_v|-alpha*l1,0}
£
ApplyRMSProp)
varShould be from a Variable()."T(
msShould be from a Variable()."T)
momShould be from a Variable()."T*
lr!Scaling factor. Must be a scalar."T'
rhoDecay rate. Must be a scalar."T
momentum"T+
epsilonRidge term. Must be a scalar."T
gradThe gradient."T
outSame as "var"."T"
Ttype:
2	"«
use_lockingbool( "If `True`, updating of the var, ms, and mom tensors is protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*1Update '*var' according to the RMSProp algorithm.2ŹNote that in dense implementation of this algorithm, ms and mom will
update even if the grad is zero, but in this sparse implementation, ms
and mom will not update in iterations during which the grad is zero.

mean_square = decay * mean_square + (1-decay) * gradient ** 2
Delta = learning_rate * gradient / sqrt(mean_square + epsilon)

ms <- rho * ms_{t-1} + (1-rho) * grad * grad
mom <- momentum * mom_{t-1} + lr * grad / sqrt(ms + epsilon)
var <- var - mom
¾
ArgMax

input"T
	dimensionint32, 0 <= dimension < rank(input).  Describes which dimension
of the input Tensor to reduce across. For vectors, use dimension = 0."Tidx

output	"
Ttype:
2	"
Tidxtype0:
2	*GReturns the index with the largest value across dimensions of a tensor.
æ
ArgMin

input"T
	dimensionint32, 0 <= dimension < rank(input).  Describes which dimension
of the input Tensor to reduce across. For vectors, use dimension = 0."Tidx

output	"
Ttype:
2	"
Tidxtype0:
2	*HReturns the index with the smallest value across dimensions of a tensor.
’
AsString

input"T

output"
Ttype:
	2	
"y
	precisionint’’’’’’’’’"ZThe post-decimal precision to use for floating point numbers.
Only used if precision > -1."K

scientificbool( "3Use scientific notation for floating point numbers."m
shortestbool( "WUse shortest representation (either scientific or standard) for
floating point numbers."
widthint’’’’’’’’’"sPad pre-decimal numbers to this width.
Applies to both floating point and integer numbers.
Only used if width > -1."
fillstring "The value to pad if width > -1.  If empty, pads with spaces.
Another typical value is '0'.  String cannot be longer than 1 character.*JConverts each entry in the given tensor to strings.  Supports many numeric2types and boolean.
P
Asin
x"T
y"T"
Ttype:
	2	* Computes asin of x element-wise.
ž
Assert)
	conditionThe condition to evaluate.
<
data1The tensors to print out when condition is false.2T"
T
list(type)(0"=
	summarizeint"'Print this many entries of each tensor.*)Asserts that the given condition is true.2If `condition` evaluates to false, print the list of tensors in `data`.
`summarize` determines how many entries of the tensors to print.
³
AssignD
ref7Should be from a `Variable` node. May be uninitialized."T5
value)The value to be assigned to the variable."T

output_ref|= Same as "ref".  Returned as a convenience for operations that want
to use the new value after the variable has been reset."T"	
Ttype"Ā
validate_shapebool("„If true, the operation will validate that the shape
of 'value' matches the shape of the Tensor being assigned to.  If false,
'ref' will take on the shape of 'value'."
use_lockingbool("zIf True, the assignment will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*(Update 'ref' by assigning 'value' to it.2This operation outputs "ref" after the assignment is done.
This makes it easier to chain operations that need to use the reset value.
ā
	AssignAdd.
ref!Should be from a `Variable` node."T2
value&The value to be added to the variable."T

output_ref~= Same as "ref".  Returned as a convenience for operations that want
to use the new value after the variable has been updated."T"
Ttype:
2	"
use_lockingbool( "xIf True, the addition will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*%Update 'ref' by adding 'value' to it.2This operation outputs "ref" after the update is done.
This makes it easier to chain operations that need to use the reset value.
ń
	AssignSub.
ref!Should be from a `Variable` node."T7
value+The value to be subtracted to the variable."T

output_ref~= Same as "ref".  Returned as a convenience for operations that want
to use the new value after the variable has been updated."T"
Ttype:
2	"
use_lockingbool( "{If True, the subtraction will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*,Update 'ref' by subtracting 'value' from it.2This operation outputs "ref" after the update is done.
This makes it easier to chain operations that need to use the reset value.
P
Atan
x"T
y"T"
Ttype:
	2	* Computes atan of x element-wise.

AudioSummaryI
tag@Scalar. Used to build the `tag` attribute of the summary values.0
tensor$2-D of shape `[batch_size, frames]`.:
summary-Scalar. Serialized `Summary` protocol buffer."=
sample_ratefloat"'The sample rate of the signal in hertz."O
max_outputsint"3Max number of batch elements to generate audio for.(0*/Outputs a `Summary` protocol buffer with audio.2ēThe summary has up to `max_outputs` summary values containing audio. The
audio is built from `tensor` which must be 3-D with shape `[batch_size,
frames, channels]` or 2-D with shape `[batch_size, frames]`. The values are
assumed to be in the range of `[-1.0, 1.0]` with a sample rate of `sample_rate`.

The `tag` argument is a scalar `Tensor` of type `string`.  It is used to
build the `tag` of the summary values:

*  If `max_outputs` is 1, the summary value tag is '*tag*/audio'.
*  If `max_outputs` is greater than 1, the summary value tags are
   generated sequentially as '*tag*/audio/0', '*tag*/audio/1', etc.BUse AudioSummaryV2.
ļ
AudioSummaryV2I
tag@Scalar. Used to build the `tag` attribute of the summary values.0
tensor$2-D of shape `[batch_size, frames]`.8
sample_rate'The sample rate of the signal in hertz.:
summary-Scalar. Serialized `Summary` protocol buffer."O
max_outputsint"3Max number of batch elements to generate audio for.(0*/Outputs a `Summary` protocol buffer with audio.2ēThe summary has up to `max_outputs` summary values containing audio. The
audio is built from `tensor` which must be 3-D with shape `[batch_size,
frames, channels]` or 2-D with shape `[batch_size, frames]`. The values are
assumed to be in the range of `[-1.0, 1.0]` with a sample rate of `sample_rate`.

The `tag` argument is a scalar `Tensor` of type `string`.  It is used to
build the `tag` of the summary values:

*  If `max_outputs` is 1, the summary value tag is '*tag*/audio'.
*  If `max_outputs` is greater than 1, the summary value tags are
   generated sequentially as '*tag*/audio/0', '*tag*/audio/1', etc.
Ū
AvgPool>
value24-D with shape `[batch, height, width, channels]`."T.
output!The average pooled output tensor."T"U
ksize	list(int)"=The size of the sliding window for each dimension of `value`.(0"Y
strides	list(int)"?The stride of the sliding window for each dimension of `value`.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"Ķ
data_formatstringNHWC"Specify the data format of the input and output data. With the
default format "NHWC", the data is stored in the order of:
    [batch, in_height, in_width, in_channels].
Alternatively, the format could be "NCHW", the data storage order of:
    [batch, in_channels, in_height, in_width].:
NHWCNCHW"
Ttype:
2*&Performs average pooling on the input.2WEach entry in `output` is the mean of the corresponding size `ksize`
window in `value`.
Ó
	AvgPool3DM
inputAShape `[batch, depth, rows, cols, channels]` tensor to pool over."T.
output!The average pooled output tensor."T"
ksize	list(int)"{1-D tensor of length 5. The size of the window for each dimension of
the input tensor. Must have `ksize[0] = ksize[4] = 1`.(0"
strides	list(int)"1-D tensor of length 5. The stride of the sliding window for each
dimension of `input`. Must have `strides[0] = strides[4] = 1`.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"
Ttype:
2	*)Performs 3D average pooling on the input.

AvgPool3DGrad4
orig_input_shapeThe original input dimensions.K
grad@Output backprop of shape `[batch, depth, rows, cols, channels]`."T$
outputThe backprop for input."T"
ksize	list(int)"{1-D tensor of length 5. The size of the window for each dimension of
the input tensor. Must have `ksize[0] = ksize[4] = 1`.(0"
strides	list(int)"1-D tensor of length 5. The stride of the sliding window for each
dimension of `input`. Must have `strides[0] = strides[4] = 1`.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"
Ttype:
2	*/Computes gradients of average pooling function.

AvgPoolGradF
orig_input_shape01-D.  Shape of the original input to `avg_pool`.i
grad^4-D with shape `[batch, height, width, channels]`.  Gradients w.r.t.
the output of `avg_pool`."T<
output/4-D.  Gradients w.r.t. the input of `avg_pool`."T"W
ksize	list(int)"?The size of the sliding window for each dimension of the input.(0"[
strides	list(int)"AThe stride of the sliding window for each dimension of the input.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"Ķ
data_formatstringNHWC"Specify the data format of the input and output data. With the
default format "NHWC", the data is stored in the order of:
    [batch, in_height, in_width, in_channels].
Alternatively, the format could be "NCHW", the data storage order of:
    [batch, in_channels, in_height, in_width].:
NHWCNCHW"
Ttype:
2*3Computes gradients of the average pooling function.
±	
Barrier)
handleThe handle to the barrier."I
component_types
list(type)"&The type of each component in a value.(0"½
shapeslist(shape)
 "The shape of each component in a value. Each shape must be 1 in the
first dimension. The length of this attr must be the same as the length of
component_types.("
capacityint’’’’’’’’’"wThe capacity of the barrier.  The default capacity is MAX_INT32,
which is the largest capacity of the underlying queue."}
	containerstring "dIf non-empty, this barrier is placed in the given container.
Otherwise, a default container is used."s
shared_namestring "XIf non-empty, this barrier will be shared under the given name
across multiple sessions.*BDefines a barrier that persists across different graph executions.2A barrier represents a key-value map, where each key is a string, and
each value is a tuple of tensors.

At runtime, the barrier contains 'complete' and 'incomplete'
elements. A complete element has defined tensors for all components of
its value tuple, and may be accessed using BarrierTakeMany. An
incomplete element has some undefined components in its value tuple,
and may be updated using BarrierInsertMany.
Ž
BarrierClose'
handleThe handle to a barrier."¾
cancel_pending_enqueuesbool( "If true, all pending enqueue requests that are
blocked on the barrier's queue will be cancelled. InsertMany will fail, even
if no new key is introduced.*Closes the given barrier.2ČThis operation signals that no more new elements will be inserted in the
given barrier. Subsequent InsertMany that try to introduce a new key will fail.
Subsequent InsertMany operations that just add missing components to already
existing elements will continue to succeed. Subsequent TakeMany operations will
continue to succeed if sufficient completed elements remain in the barrier.
Subsequent TakeMany operations that would block will fail immediately.
ų
BarrierIncompleteSize'
handleThe handle to a barrier.t
sizejThe number of incomplete elements (i.e. those with some of their value
components not set) in the barrier.*@Computes the number of incomplete elements in the given barrier.
æ
BarrierInsertMany'
handleThe handle to a barrier.:
keys0A one-dimensional tensor of keys, with length n.
valuesyAn any-dimensional tensor of values, which are associated with the
respective keys. The 0th dimension must have length n."T"	
Ttype"U
component_indexint"=The component of the barrier elements that is being assigned.*FFor each key, assigns the respective value to the specified component.2If a key is not found in the barrier, this operation will create a new
incomplete element. If a key is found in the barrier, and the element
already has a value at component_index, this operation will fail with
INVALID_ARGUMENT, and leave the barrier in an undefined state.
ź
BarrierReadySize'
handleThe handle to a barrier.m
sizecThe number of complete elements (i.e. those with all of their value
components set) in the barrier.*>Computes the number of complete elements in the given barrier.
š

BarrierTakeMany'
handleThe handle to a barrier.T
num_elementsBA single-element tensor containing the number of elements to
take.ą
indicesŅA one-dimensional tensor of indices, with length num_elems.
These indices refer to the batch in which the values were placed into the
barrier (starting with MIN_LONG and increasing with each BarrierInsertMany).	E
keys;A one-dimensional tensor of keys, with length num_elements.
valuesxOne any-dimensional tensor per component in a barrier element. All
values have length num_elements in the 0th dimension.2component_types"I
component_types
list(type)"&The type of each component in a value.(0"i
allow_small_batchbool( "JAllow to return less than num_elements items if barrier is
already closed."
wait_for_incompletebool( "

timeout_msint’’’’’’’’’"{If the queue is empty, this operation will block for up to
timeout_ms milliseconds.
Note: This option is not supported yet.*<Takes the given number of completed elements from a barrier.2źThis operation concatenates completed-element component tensors along
the 0th dimension to make a single component tensor.

Elements come out of the barrier when they are complete, and in the order
in which they were placed into the barrier.  The indices output provides
information about the batch in which each element was originally inserted
into the barrier.
V
BatchCholesky

input"T
output"T"
Ttype:
2BUse Cholesky instead.
e
BatchCholeskyGrad
l"T	
grad"T
output"T"
Ttype:
2BUse CholeskyGrad instead.
.
BatchFFT	
input

outputBUse FFT
2

BatchFFT2D	
input

outputB	Use FFT2D
2

BatchFFT3D	
input

outputB	Use FFT3D
0
	BatchIFFT	
input

outputBUse IFFT
4
BatchIFFT2D	
input

outputB
Use IFFT2D
4
BatchIFFT3D	
input

outputB
Use IFFT3D
š
BatchMatMul3
x+3-D or higher with shape `[..., r_x, c_x]`."T3
y+3-D or higher with shape `[..., r_y, c_y]`."T7
output*3-D or higher with shape `[..., r_o, c_o]`"T"
Ttype:

2"M
adj_xbool( ":If `True`, adjoint the slices of `x`. Defaults to `False`."M
adj_ybool( ":If `True`, adjoint the slices of `y`. Defaults to `False`.*,Multiplies slices of two tensors in batches.2ŚMultiplies all slices of `Tensor` `x` and `y` (each slice can be
viewed as an element of a batch), and arranges the individual results
in a single output tensor of the same batch size. Each of the
individual slices can optionally be adjointed (to adjoint a matrix
means to transpose and conjugate it) before multiplication by setting
the `adj_x` or `adj_y` flag to `True`, which are by default `False`.

The input tensors `x` and `y` are 3-D or higher with shape `[..., r_x, c_x]`
and `[..., r_y, c_y]`.

The output tensor is 3-D or higher with shape `[..., r_o, c_o]`, where:

    r_o = c_x if adj_x else r_x
    c_o = r_y if adj_y else c_y

It is computed as:

    output[..., :, :] = matrix(x[..., :, :]) * matrix(y[..., :, :])
m
BatchMatrixBandPart

input"T
	num_lower	
	num_upper		
band"T"	
TtypeBUse MatrixBandPart
h
BatchMatrixDeterminant

input"T
output"T"
Ttype:
2B"Use MatrixDeterminant instead.
L
BatchMatrixDiag
diagonal"T
output"T"	
TtypeBUse MatrixDiag
S
BatchMatrixDiagPart

input"T
diagonal"T"	
TtypeBUse MatrixDiagPart
u
BatchMatrixInverse

input"T
output"T"
adjointbool( "
Ttype:
2BUse MatrixInverse instead.
^
BatchMatrixSetDiag

input"T
diagonal"T
output"T"	
TtypeBUse MatrixSetDiag
|
BatchMatrixSolve
matrix"T
rhs"T
output"T"
adjointbool( "
Ttype:
2BUse MatrixSolve instead.

BatchMatrixSolveLs
matrix"T
rhs"T
l2_regularizer
output"T"
Ttype:
2"
fastbool(BUse MatrixSolveLs instead.
£
BatchMatrixTriangularSolve
matrix"T
rhs"T
output"T"
lowerbool("
adjointbool( "
Ttype:
2B&"Use MatrixTriangularSolve instead.
ż
 BatchNormWithGlobalNormalization
tA 4D input Tensor."T
mA 1D mean Tensor with size matching the last dimension of t.
This is the first output from tf.nn.moments,
or a saved moving average thereof."T
vA 1D variance Tensor with size matching the last dimension of t.
This is the second output from tf.nn.moments,
or a saved moving average thereof."Tw
betalA 1D beta Tensor with size matching the last dimension of t.
An offset to be added to the normalized tensor."T­
gamma A 1D gamma Tensor with size matching the last dimension of t.
If "scale_after_normalization" is true, this tensor will be multiplied
with the normalized tensor."T
result"T"
Ttype:
2	"G
variance_epsilonfloat",A small float number to avoid dividing by 0."s
scale_after_normalizationbool"PA bool indicating whether the resulted tensor
needs to be multiplied with gamma.*Batch normalization.2:This op is deprecated. Prefer `tf.nn.batch_normalization`.B#	Use tf.nn.batch_normalization()
ó
$BatchNormWithGlobalNormalizationGrad
tA 4D input Tensor."T
mA 1D mean Tensor with size matching the last dimension of t.
This is the first output from tf.nn.moments,
or a saved moving average thereof."T
vA 1D variance Tensor with size matching the last dimension of t.
This is the second output from tf.nn.moments,
or a saved moving average thereof."T­
gamma A 1D gamma Tensor with size matching the last dimension of t.
If "scale_after_normalization" is true, this Tensor will be multiplied
with the normalized Tensor."T"
backprop4D backprop Tensor."T&
dx4D backprop tensor for input."T%
dm1D backprop tensor for mean."T)
dv 1D backprop tensor for variance."T%
db1D backprop tensor for beta."T&
dg1D backprop tensor for gamma."T"
Ttype:
2	"G
variance_epsilonfloat",A small float number to avoid dividing by 0."s
scale_after_normalizationbool"PA bool indicating whether the resulted tensor
needs to be multiplied with gamma.*"Gradients for batch normalization.27This op is deprecated. See `tf.nn.batch_normalization`.B#	Use tf.nn.batch_normalization()
d
BatchSelfAdjointEig

input"T
output"T"
Ttype:
2B!Use SelfAdjointEigV2 instead.

BatchSelfAdjointEigV2

input"T
e"T
v"T"
	compute_vbool("
Ttype:
2B!Use SelfAdjointEigV2 instead.

BatchSvd

input"T
s"T
u"T
v"T"

compute_uvbool("
full_matricesbool( "
Ttype:
2BUse Svd instead.
é
BatchToSpaceÖ
inputÉ4-D tensor with shape
`[batch*block_size*block_size, height_pad/block_size, width_pad/block_size,
  depth]`. Note that the batch size of the input tensor must be divisible by
`block_size * block_size`."Tö
cropsę2-D tensor of non-negative integers with shape `[2, 2]`. It specifies
how many elements to crop from the intermediate result across the spatial
dimensions as follows:

    crops = [[crop_top, crop_bottom], [crop_left, crop_right]]"Tidxź
outputÜ4-D with shape `[batch, height, width, depth]`, where:

      height = height_pad - crop_top - crop_bottom
      width = width_pad - crop_left - crop_right

The attr `block_size` must be greater than one. It indicates the block size.

Some examples:

(1) For the following input of shape `[4, 1, 1, 1]` and block_size of 2:

```prettyprint
[[[[1]]], [[[2]]], [[[3]]], [[[4]]]]
```

The output tensor has shape `[1, 2, 2, 1]` and value:

```prettyprint
x = [[[[1], [2]], [[3], [4]]]]
```

(2) For the following input of shape `[4, 1, 1, 3]` and block_size of 2:

```prettyprint
[[[1, 2, 3]], [[4, 5, 6]], [[7, 8, 9]], [[10, 11, 12]]]
```

The output tensor has shape `[1, 2, 2, 3]` and value:

```prettyprint
x = [[[[1, 2, 3], [4, 5, 6]],
      [[7, 8, 9], [10, 11, 12]]]]
```

(3) For the following input of shape `[4, 2, 2, 1]` and block_size of 2:

```prettyprint
x = [[[[1], [3]], [[5], [7]]],
     [[[2], [4]], [[10], [12]]],
     [[[5], [7]], [[13], [15]]],
     [[[6], [8]], [[14], [16]]]]
```

The output tensor has shape `[1, 4, 4, 1]` and value:

```prettyprint
x = [[[1],   [2],  [3],  [4]],
     [[5],   [6],  [7],  [8]],
     [[9],  [10], [11],  [12]],
     [[13], [14], [15],  [16]]]
```

(4) For the following input of shape `[8, 1, 2, 1]` and block_size of 2:

```prettyprint
x = [[[[1], [3]]], [[[9], [11]]], [[[2], [4]]], [[[10], [12]]],
     [[[5], [7]]], [[[13], [15]]], [[[6], [8]]], [[[14], [16]]]]
```

The output tensor has shape `[2, 2, 4, 1]` and value:

```prettyprint
x = [[[[1], [3]], [[5], [7]]],
     [[[2], [4]], [[10], [12]]],
     [[[5], [7]], [[13], [15]]],
     [[[6], [8]], [[14], [16]]]]
```"T"	
Ttype"

block_sizeint(0"
Tidxtype0:
2	*'BatchToSpace for 4-D tensors of type T.2“This is a legacy version of the more general BatchToSpaceND.

Rearranges (permutes) data from batch into blocks of spatial data, followed by
cropping. This is the reverse transformation of SpaceToBatch. More specifically,
this op outputs a copy of the input tensor where values from the `batch`
dimension are moved in spatial blocks to the `height` and `width` dimensions,
followed by cropping along the `height` and `width` dimensions.
Č
BatchToSpaceND{
inputoN-D with shape `input_shape = [batch] + spatial_shape + remaining_shape`,
where spatial_shape has M dimensions."TK
block_shape.1-D with shape `[M]`, all values must be >= 1."Tblock_shape§
crops2-D with shape `[M, 2]`, all values must be >= 0.
  `crops[i] = [crop_start, crop_end]` specifies the amount to crop from input
  dimension `i + 1`, which corresponds to spatial dimension `i`.  It is
  required that
  `crop_start[i] + crop_end[i] <= block_shape[i] * input_shape[i + 1]`.

This operation is equivalent to the following steps:

1. Reshape `input` to `reshaped` of shape:
     [block_shape[0], ..., block_shape[M-1],
      batch / prod(block_shape),
      input_shape[1], ..., input_shape[N-1]]

2. Permute dimensions of `reshaped` to produce `permuted` of shape
     [batch / prod(block_shape),

      input_shape[1], block_shape[0],
      ...,
      input_shape[M], block_shape[M-1],

      input_shape[M+1], ..., input_shape[N-1]]

3. Reshape `permuted` to produce `reshaped_permuted` of shape
     [batch / prod(block_shape),

      input_shape[1] * block_shape[0],
      ...,
      input_shape[M] * block_shape[M-1],

      input_shape[M+1],
      ...,
      input_shape[N-1]]

4. Crop the start and end of dimensions `[1, ..., M]` of
   `reshaped_permuted` according to `crops` to produce the output of shape:
     [batch / prod(block_shape),

      input_shape[1] * block_shape[0] - crops[0,0] - crops[0,1],
      ...,
      input_shape[M] * block_shape[M-1] - crops[M-1,0] - crops[M-1,1],

      input_shape[M+1], ..., input_shape[N-1]]

Some examples:

(1) For the following input of shape `[4, 1, 1, 1]`, `block_shape = [2, 2]`, and
    `crops = [[0, 0], [0, 0]]`:

```prettyprint
[[[[1]]], [[[2]]], [[[3]]], [[[4]]]]
```

The output tensor has shape `[1, 2, 2, 1]` and value:

```prettyprint
x = [[[[1], [2]], [[3], [4]]]]
```

(2) For the following input of shape `[4, 1, 1, 3]`, `block_shape = [2, 2]`, and
    `crops = [[0, 0], [0, 0]]`:

```prettyprint
[[[1, 2, 3]], [[4, 5, 6]], [[7, 8, 9]], [[10, 11, 12]]]
```

The output tensor has shape `[1, 2, 2, 3]` and value:

```prettyprint
x = [[[[1, 2, 3], [4, 5, 6]],
      [[7, 8, 9], [10, 11, 12]]]]
```

(3) For the following input of shape `[4, 2, 2, 1]`, `block_shape = [2, 2]`, and
    `crops = [[0, 0], [0, 0]]`:

```prettyprint
x = [[[[1], [3]], [[5], [7]]],
     [[[2], [4]], [[10], [12]]],
     [[[5], [7]], [[13], [15]]],
     [[[6], [8]], [[14], [16]]]]
```

The output tensor has shape `[1, 4, 4, 1]` and value:

```prettyprint
x = [[[1],   [2],  [3],  [4]],
     [[5],   [6],  [7],  [8]],
     [[9],  [10], [11],  [12]],
     [[13], [14], [15],  [16]]]
```

(4) For the following input of shape `[8, 1, 3, 1]`, `block_shape = [2, 2]`, and
    `crops = [[0, 0], [2, 0]]`:

```prettyprint
x = [[[[0], [1], [3]]], [[[0], [9], [11]]],
     [[[0], [2], [4]]], [[[0], [10], [12]]],
     [[[0], [5], [7]]], [[[0], [13], [15]]],
     [[[0], [6], [8]]], [[[0], [14], [16]]]]
```

The output tensor has shape `[2, 2, 4, 1]` and value:

```prettyprint
x = [[[[1],   [2],  [3],  [4]],
      [[5],   [6],  [7],  [8]]],
     [[[9],  [10], [11],  [12]],
      [[13], [14], [15],  [16]]]]
```"Tcrops
output"T"	
Ttype" 
Tblock_shapetype0:
2	"
Tcropstype0:
2	*'BatchToSpace for N-D tensors of type T.2ĀThis operation reshapes the "batch" dimension 0 into `M + 1` dimensions of shape
`block_shape + [batch]`, interleaves these blocks back into the grid defined by
the spatial dimensions `[1, ..., M]`, to obtain a result with the same rank as
the input.  The spatial dimensions of this intermediate result are then
optionally cropped according to `crops` to produce the output.  This is the
reverse of SpaceToBatch.  See below for a precise description.
ū
Betainc
a"T
b"T
x"T
z"T"
Ttype:
2*ACompute the regularized incomplete beta integral \\(I_x(a, b)\\).2łThe regularized incomplete beta integral is defined as:

```
I_x(a, b) = \frac{B(x; a, b)}{B(a, b)}
```
where

```
B(x; a, b) = \int_0^x t^{a-1} (1 - t)^{b-1} dt
```

is the incomplete beta function and \\(B(a, b)\\) is the *complete*
beta function.

BiasAdd%
valueAny number of dimensions."T7
bias,1-D with size the last dimension of `value`."T3
output&Broadcasted sum of `value` and `bias`."T"
Ttype:
2	"
data_formatstringNHWC"ćSpecify the data format of the input and output data. With the
default format "NHWC", the bias tensor will be added to the last dimension
of the value tensor.
Alternatively, the format could be "NCHW", the data storage order of:
    [batch, in_channels, in_height, in_width].
The tensor will be added to "in_channels", the third-to-the-last
    dimension.:
NHWCNCHW*Adds `bias` to `value`.2This is a special case of `tf.add` where `bias` is restricted to be 1-D.
Broadcasting is supported, so `value` may have any number of dimensions.
ŗ
BiasAddGrad,
out_backpropAny number of dimensions."TC
output61-D with size the feature dimension of `out_backprop`."T"
Ttype:
2	"
data_formatstringNHWC"ćSpecify the data format of the input and output data. With the
default format "NHWC", the bias tensor will be added to the last dimension
of the value tensor.
Alternatively, the format could be "NCHW", the data storage order of:
    [batch, in_channels, in_height, in_width].
The tensor will be added to "in_channels", the third-to-the-last
    dimension.:
NHWCNCHW*:The backward operation for "BiasAdd" on the "bias" tensor.2ĘIt accumulates all the values from out_backprop into the feature dimension.
For NHWC data format, the feature dimension is the last. For NCHW data format,
the feature dimension is the third-to-last.
Æ
	BiasAddV1%
valueAny number of dimensions."T7
bias,1-D with size the last dimension of `value`."T3
output&Broadcasted sum of `value` and `bias`."T"
Ttype:
2	*Adds `bias` to `value`.2ŌThis is a deprecated version of BiasAdd and will be soon removed.

This is a special case of `tf.add` where `bias` is restricted to be 1-D.
Broadcasting is supported, so `value` may have any number of dimensions.
ģ
Bitcast

input"T
output"type"
Ttype:
2	" 
typetype:
2	*@Bitcasts a tensor from one type to another without copying data.2ĮGiven a tensor `input`, this operation returns a tensor that has the same buffer
data as `input` with datatype `type`.

If the input datatype `T` is larger than the output datatype `type` then the
shape changes from [...] to [..., sizeof(`T`)/sizeof(`type`)].

If `T` is smaller than `type`, the operator requires that the rightmost
dimension be equal to sizeof(`type`)/sizeof(`T`). The shape then goes from
[..., sizeof(`type`)/sizeof(`T`)] to [...].

*NOTE*: Bitcast is implemented as a low-level cast, so machines with different
endian orderings will give different results.
÷
BroadcastArgs
s0"T
s1"T
r0"T"
Ttype0:
2	*,Return the shape of s0 op s1 with broadcast.2Given `s0` and `s1`, tensors that represent shapes, compute `r0`, the
broadcasted shape. `s0`, `s1` and `r0` are all integer vectors.
ó
BroadcastGradientArgs
s0"T
s1"T
r0"T
r1"T"
Ttype0:
2	*PReturn the reduction indices for computing gradients of s0 op s1 with broadcast.2MThis is typically used by gradient computations for a broadcasting operation.
å
CTCBeamSearchDecoderL
inputs@3-D, shape: `(max_time x batch_size x num_classes)`, the logits.J
sequence_length5A vector containing sequence lengths, size `(batch)`.Ķ
decoded_indices¬A list (length: top_paths) of indices matrices.  Matrix j,
size `(total_decoded_outputs[j] x 2)`, has indices of a
`SparseTensor<int64, 2>`.  The rows store: [batch, time].	*	top_pathsć
decoded_valuesĆA list (length: top_paths) of values vectors.  Vector j,
size `(length total_decoded_outputs[j])`, has the values of a
`SparseTensor<int64, 2>`.  The vector stores the decoded classes for beam j.	*	top_pathsĖ
decoded_shape¬A list (length: top_paths) of shape vector.  Vector j,
size `(2)`, stores the shape of the decoded `SparseTensor[j]`.
Its values are: `[batch_size, max_decoded_length[j]]`.	*	top_pathsc
log_probabilityNA matrix, shaped: `(batch_size x top_paths)`.  The
sequence log-probabilities.">

beam_widthint"'A scalar >= 0 (beam search beam width).(0"J
	top_pathsint"4A scalar >= 0, <= beam_width (controls output size).(0"F
merge_repeatedbool("*If true, merge repeated classes in output.*;Performs beam search decoding on the logits given in input.2øA note about the attribute merge_repeated: For the beam search decoder,
this means that if consecutive entries in a beam are the same, only
the first of these is emitted.  That is, when the top path is "A B B B B",
"A B" is returned if merge_repeated = True but "A B B B B" is
returned if merge_repeated = False.
ē	
CTCGreedyDecoderL
inputs@3-D, shape: `(max_time x batch_size x num_classes)`, the logits.O
sequence_length:A vector containing sequence lengths, size `(batch_size)`.
decoded_indicesrIndices matrix, size `(total_decoded_outputs x 2)`,
of a `SparseTensor<int64, 2>`.  The rows store: [batch, time].	
decoded_valuesvValues vector, size: `(total_decoded_outputs)`,
of a `SparseTensor<int64, 2>`.  The vector stores the decoded classes.	y
decoded_shapefShape vector, size `(2)`, of the decoded SparseTensor.
Values are: `[batch_size, max_decoded_length]`.	\
log_probabilityGMatrix, size `(batch_size x 1)`, containing sequence
log-probabilities."F
merge_repeatedbool( "*If True, merge repeated classes in output.*7Performs greedy decoding on the logits given in inputs.2ĀA note about the attribute merge_repeated: if enabled, when
consecutive logits' maximum indices are the same, only the first of
these is emitted.  Labeling the blank '*', the sequence "A B B * B B"
becomes "A B" if merge_repeated = True and "A B B B B" if
merge_repeated = False.

Regardless of the value of merge_repeated, if the maximum index of a given
time and batch corresponds to the blank, index `(num_classes - 1)`, no new
element is emitted.
Ļ
CTCLossL
inputs@3-D, shape: `(max_time x batch_size x num_classes)`, the logits. 
labels_indicesThe indices of a `SparseTensor<int32, 2>`.
`labels_indices(i, :) == [b, t]` means `labels_values(i)` stores the id for
`(batch b, time t)`.	P
labels_values=The values (labels) associated with the given batch and time.B
sequence_length-A vector containing sequence lengths (batch).8
loss.A vector (batch) containing log-probabilities.[
gradientMThe gradient of `loss`.  3-D, shape:
`(max_time x batch_size x num_classes)`."z
preprocess_collapse_repeatedbool( "PScalar, if true then repeated labels are
collapsed prior to the CTC calculation."Š
ctc_merge_repeatedbool("ÆScalar.  If set to false, *during* CTC calculation
repeated non-blank labels will not be merged and are interpreted as
individual labels.  This is a simplified version of CTC.*PCalculates the CTC Loss (log probability) for each batch entry.  Also calculates2the gradient.  This class performs the softmax operation for you, so inputs
should be e.g. linear projections of outputs by an LSTM.
[
Cast	
x"SrcT	
y"DstT"
SrcTtype"
DstTtype*!Cast x of type SrcT to y of DstT.
e
Ceil
x"T
y"T"
Ttype:
2*9Returns element-wise smallest integer in not less than x.
²
CheckNumerics
tensor"T
output"T"
Ttype:
2"/
messagestring"Prefix of the error message.*'Checks a tensor for NaN and Inf values.2When run, reports an `InvalidArgument` error if `tensor` has any values
that are not a number (NaN) or infinity (Inf). Otherwise, passes `tensor` as-is.
ć
Cholesky#
inputShape is `[..., M, M]`."T$
outputShape is `[..., M, M]`."T"
Ttype:
2*CComputes the Cholesky decomposition of one or more square matrices.2³The input is a tensor of shape `[..., M, M]` whose inner-most 2 dimensions
form square matrices, with the same constraints as the single matrix Cholesky
decomposition above. The output is a tensor of the same shape as the input
containing the Cholesky decompositions for all input submatrices `[..., :, :]`.
’
CholeskyGrad®
l„Output of batch Cholesky algorithm l = cholesky(A). Shape is `[..., M, M]`.
Algorithm depends only on lower triangular part of the innermost matrices of
this tensor."T¤
graddf/dl where f is some scalar function. Shape is `[..., M, M]`.
Algorithm depends only on lower triangular part of the innermost matrices of
this tensor."TB
output5Symmetrized version of df/dA . Shape is `[..., M, M]`"T"
Ttype:
2*LComputes the reverse mode backpropagated gradient of the Cholesky algorithm.2rFor an explanation see "Differentiation of the Cholesky algorithm" by
Iain Murray http://arxiv.org/abs/1602.07527.

Complex	
real"T	
imag"T
out"Tout"
Ttype0:
2"
Touttype0:
2*.Converts two real numbers to a complex number.2öGiven a tensor `real` representing the real part of a complex number, and a
tensor `imag` representing the imaginary part of a complex number, this
operation returns complex numbers elementwise of the form \\(a + bj\\), where
*a* represents the `real` part and *b* represents the `imag` part.

The input tensors `real` and `imag` must have the same shape.

For example:

```
# tensor 'real' is [2.25, 3.25]
# tensor `imag` is [4.75, 5.75]
tf.complex(real, imag) ==> [[2.25 + 4.75j], [3.25 + 5.75j]]
```


ComplexAbs
x"T	
y"Tout"
Ttype0:
2"
Touttype0:
2*0Computes the complex absolute value of a tensor.2Given a tensor `x` of complex numbers, this operation returns a tensor of type
`float` or `double` that is the absolute value of each element in `x`. All
elements in `x` must be complex numbers of the form \\(a + bj\\). The absolute
value is computed as \\( \sqrt{a^2 + b^2}\\).
ę
ComputeAccidentalHits@
true_classes.The true_classes output of UnpackSparseLabels.	J
sampled_candidates2The sampled_candidates output of CandidateSampler.	J
indices=A vector of indices corresponding to rows of true_candidates.
idsA vector of IDs of positions in sampled_candidates that match a true_label
for the row with the corresponding index in indices.	a
weightsTA vector of the same length as indices and ids, in which each element
is -FLOAT_MAX."3
num_trueint""Number of true labels per context."„
seedint "If either seed or seed2 are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."9
seed2int "'An second seed to avoid seed collision.*OComputes the ids of the positions in sampled_candidates that match true_labels.2When doing log-odds NCE, the result of this op should be passed through a
SparseToDense op, then added to the logits of the sampled candidates. This has
the effect of 'removing' the sampled labels that match the true labels by
making the classifier sure that they are sampled labels.

Concath

concat_dimX0-D.  The dimension along which to concatenate.  Must be in the
range [0, rank(values)).
valuesThe `N` Tensors to concatenate. Their ranks and types must match,
and their sizes must match in all dimensions except `concat_dim`."T*NĖ
output½A `Tensor` with the concatenation of values stacked along the
`concat_dim` dimension.  This tensor's shape matches that of `values` except
in `concat_dim` where it has the sum of the sizes."T"
Nint(0"	
Ttype*)Concatenates tensors along one dimension.
Ź
ConcatOffset9

concat_dim)The dimension along which to concatenate.U
shapeGThe `N` int32 vectors representing shape of tensors being concatenated.*NČ
offsetøThe `N` int32 vectors representing the starting offset
        of input tensors within the concatenated output.

This is typically used by gradient computations for a concat operation.*N"
Nint(0*4Computes offsets of concat inputs within its output.2For example:

```prettyprint
# 'x' is [2, 2, 7]
# 'y' is [2, 3, 7]
# 'z' is [2, 5, 7]
concat_offset(2, [x, y, z]) => [0, 0, 0], [0, 2, 0], [0, 5, 0]
```
Å
ConcatV2
valuesList of `N` Tensors to concatenate. Their ranks and types must match,
and their sizes must match in all dimensions except `concat_dim`."T*Nr
axisd0-D.  The dimension along which to concatenate.  Must be in the
range [-rank(values), rank(values))."TidxĖ
output½A `Tensor` with the concatenation of values stacked along the
`concat_dim` dimension.  This tensor's shape matches that of `values` except
in `concat_dim` where it has the sum of the sizes."T"
Nint(0"	
Ttype"
Tidxtype0:
2	*)Concatenates tensors along one dimension.

ConditionalAccumulator-
handleThe handle to the accumulator."K
dtypetype"(The type of the value being accumulated.:
2	"S
shapeshape"CThe shape of the values, can be [], in which case shape is unknown."
	containerstring "hIf non-empty, this accumulator is placed in the given container.
Otherwise, a default container is used."w
shared_namestring "\If non-empty, this accumulator will be shared under the given name
across multiple sessions.*LA conditional accumulator for aggregating gradients. The accumulator accepts2Īgradients marked with local_step greater or equal to the most recent global_step
known to the accumulator. The average can be extracted from the accumulator,
provided sufficient gradients have been accumulated. Extracting the average
automatically resets the aggregate to 0, and increments the global_step recorded
by the accumulator.
É
Conj

input"T
output"T"
Ttype0:
2*2Returns the complex conjugate of a complex number.2ÜGiven a tensor `input` of complex numbers, this operation returns a tensor of
complex numbers that are the complex conjugate of each element in `input`. The
complex numbers in `input` must be of the form \\(a + bj\\), where *a* is the
real part and *b* is the imaginary part.

The complex conjugate returned by this operation is of the form \\(a - bj\\).

For example:

```
# tensor 'input' is [-2.25 + 4.75j, 3.25 + 5.75j]
tf.conj(input) ==> [-2.25 - 4.75j, 3.25 - 5.75j]
```
{
Const
output"dtype"6
valuetensor"%Attr `value` is the tensor to return."
dtypetype*Returns a constant tensor.
|
ControlTrigger*9Does nothing. Serves as a control trigger for scheduling.2/Only useful as a placeholder for control edges.

Conv2D

input"T
filter"T
output"T"
Ttype:
2"Ŗ
strides	list(int)"1-D of length 4.  The stride of the sliding window for each dimension
of `input`. Must be in the same order as the dimension specified with format."
use_cudnn_on_gpubool("I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"Ķ
data_formatstringNHWC"Specify the data format of the input and output data. With the
default format "NHWC", the data is stored in the order of:
    [batch, in_height, in_width, in_channels].
Alternatively, the format could be "NCHW", the data storage order of:
    [batch, in_channels, in_height, in_width].:
NHWCNCHW*BComputes a 2-D convolution given 4-D `input` and `filter` tensors.2Given an input tensor of shape `[batch, in_height, in_width, in_channels]`
and a filter / kernel tensor of shape
`[filter_height, filter_width, in_channels, out_channels]`, this op
performs the following:

1. Flattens the filter to a 2-D matrix with shape
   `[filter_height * filter_width * in_channels, output_channels]`.
2. Extracts image patches from the input tensor to form a *virtual*
   tensor of shape `[batch, out_height, out_width,
   filter_height * filter_width * in_channels]`.
3. For each patch, right-multiplies the filter matrix and the image patch
   vector.

In detail, with the default NHWC format,

    output[b, i, j, k] =
        sum_{di, dj, q} input[b, strides[1] * i + di, strides[2] * j + dj, q] *
                        filter[di, dj, q, k]

Must have `strides[0] = strides[3] = 1`.  For the most common case of the same
horizontal and vertices strides, `strides = [1, stride, stride, 1]`.
ć	
Conv2DBackpropFilterG
input;4-D with shape `[batch, in_height, in_width, in_channels]`."TŖ
filter_sizesAn integer vector representing the tensor shape of `filter`,
where `filter` is a 4-D
`[filter_height, filter_width, in_channels, out_channels]` tensor.
out_backpropn4-D with shape `[batch, out_height, out_width, out_channels]`.
Gradients w.r.t. the output of the convolution."T
output4-D with shape
`[filter_height, filter_width, in_channels, out_channels]`.  Gradient w.r.t.
the `filter` input of the convolution."T"
Ttype:
2"­
strides	list(int)"The stride of the sliding window for each dimension of the input
of the convolution. Must be in the same order as the dimension specified with
format."
use_cudnn_on_gpubool("I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"Ķ
data_formatstringNHWC"Specify the data format of the input and output data. With the
default format "NHWC", the data is stored in the order of:
    [batch, in_height, in_width, in_channels].
Alternatively, the format could be "NCHW", the data storage order of:
    [batch, in_channels, in_height, in_width].:
NHWCNCHW*AComputes the gradients of convolution with respect to the filter.
“	
Conv2DBackpropInput
input_sizesvAn integer vector representing the shape of `input`,
where `input` is a 4-D `[batch, height, width, channels]` tensor.W
filterJ4-D with shape
`[filter_height, filter_width, in_channels, out_channels]`."T
out_backpropn4-D with shape `[batch, out_height, out_width, out_channels]`.
Gradients w.r.t. the output of the convolution."Tw
outputj4-D with shape `[batch, in_height, in_width, in_channels]`.  Gradient
w.r.t. the input of the convolution."T"
Ttype:
2"­
strides	list(int)"The stride of the sliding window for each dimension of the input
of the convolution. Must be in the same order as the dimension specified with
format."
use_cudnn_on_gpubool("I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"Ķ
data_formatstringNHWC"Specify the data format of the input and output data. With the
default format "NHWC", the data is stored in the order of:
    [batch, in_height, in_width, in_channels].
Alternatively, the format could be "NCHW", the data storage order of:
    [batch, in_channels, in_height, in_width].:
NHWCNCHW*@Computes the gradients of convolution with respect to the input.
Ę
Conv3DH
input<Shape `[batch, in_depth, in_height, in_width, in_channels]`."T
filterShape `[filter_depth, filter_height, filter_width, in_channels,
out_channels]`. `in_channels` must match between `input` and `filter`."T
output"T"
Ttype:
2	"
strides	list(int)"1-D tensor of length 5. The stride of the sliding window for each
dimension of `input`. Must have `strides[0] = strides[4] = 1`.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*BComputes a 3-D convolution given 5-D `input` and `filter` tensors.2In signal processing, cross-correlation is a measure of similarity of
two waveforms as a function of a time-lag applied to one of them. This
is also known as a sliding dot product or sliding inner-product.

Our Conv3D implements a form of cross-correlation.
²
Conv3DBackpropFilter<
input0Shape `[batch, depth, rows, cols, in_channels]`."T{
filternShape `[depth, rows, cols, in_channels, out_channels]`.
`in_channels` must match between `input` and `filter`."Tc
out_backpropPBackprop signal of shape `[batch, out_depth, out_rows, out_cols,
out_channels]`."T
output"T"
Ttype:
2	"
strides	list(int)"1-D tensor of length 5. The stride of the sliding window for each
dimension of `input`. Must have `strides[0] = strides[4] = 1`.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*EComputes the gradients of 3-D convolution with respect to the filter.B
Use Conv3DBackpropFilterV2
Ņ
Conv3DBackpropFilterV2<
input0Shape `[batch, depth, rows, cols, in_channels]`."Tø
filter_sizes„An integer vector representing the tensor shape of `filter`,
where `filter` is a 5-D
`[filter_depth, filter_height, filter_width, in_channels, out_channels]`
tensor.c
out_backpropPBackprop signal of shape `[batch, out_depth, out_rows, out_cols,
out_channels]`."T
output"T"
Ttype:
2	"
strides	list(int)"1-D tensor of length 5. The stride of the sliding window for each
dimension of `input`. Must have `strides[0] = strides[4] = 1`.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*EComputes the gradients of 3-D convolution with respect to the filter.
Æ
Conv3DBackpropInput<
input0Shape `[batch, depth, rows, cols, in_channels]`."T{
filternShape `[depth, rows, cols, in_channels, out_channels]`.
`in_channels` must match between `input` and `filter`."Tc
out_backpropPBackprop signal of shape `[batch, out_depth, out_rows, out_cols,
out_channels]`."T
output"T"
Ttype:
2	"
strides	list(int)"1-D tensor of length 5. The stride of the sliding window for each
dimension of `input`. Must have `strides[0] = strides[4] = 1`.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*DComputes the gradients of 3-D convolution with respect to the input.B
Use Conv3DBackpropInputV2
ķ
Conv3DBackpropInputV2
input_sizesAn integer vector representing the tensor shape of `input`,
where `input` is a 5-D
`[batch, depth, rows, cols, in_channels]` tensor.{
filternShape `[depth, rows, cols, in_channels, out_channels]`.
`in_channels` must match between `input` and `filter`."Tc
out_backpropPBackprop signal of shape `[batch, out_depth, out_rows, out_cols,
out_channels]`."T
output"T"
Ttype:
2	"
strides	list(int)"1-D tensor of length 5. The stride of the sliding window for each
dimension of `input`. Must have `strides[0] = strides[4] = 1`.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*DComputes the gradients of 3-D convolution with respect to the input.
ū
Copy
inputInput tensor."T3
output&Output tensor, deep-copied from input."T"	
Ttype"8
tensor_namestring "The name of the input tensor.*Copy Op.2ŠPerforms CPU-to-CPU or GPU-to-GPU deep-copying of tensor, depending on the
device on which the tensor is allocated.

Unlike the CopyHost Op, this op does not have HostMemory constraint on its
input or output.
­
CopyHost
inputInput tensor."T3
output&Output tensor, deep-copied from input."T"	
Ttype"8
tensor_namestring "The name of the input tensor.*Copy Host Op.2zPerforms CPU-to-CPU deep-copying of tensor.

Unlike the Copy Op, this op has HostMemory constraint on its input or output.
L
Cos
x"T
y"T"
Ttype:	
2*Computes cos of x element-wise.
ģ
	CountUpTo5
ref(Should be from a scalar `Variable` node."T
outputsA copy of the input before increment. If nothing else modifies the
input, the values produced will all be distinct."T"f
limitint"XIf incrementing ref would bring it above limit, instead generates an
'OutOfRange' error."
Ttype:
2	**Increments 'ref' until it reaches 'limit'.
¶
CropAndResize
image}A 4-D tensor of shape `[batch, image_height, image_width, depth]`.
Both `image_height` and `image_width` need to be positive."TĢ
boxesĄA 2-D tensor of shape `[num_boxes, 4]`. The `i`-th row of the tensor
specifies the coordinates of a box in the `box_ind[i]` image and is specified
in normalized coordinates `[y1, x1, y2, x2]`. A normalized coordinate value of
`y` is mapped to the image coordinate at `y * (image_height - 1)`, so as the
`[0, 1]` interval of normalized image height is mapped to
`[0, image_height - 1] in image height coordinates. We do allow y1 > y2, in
which case the sampled crop is an up-down flipped version of the original
image. The width dimension is treated similarly. Normalized coordinates
outside the `[0, 1]` range are allowed, in which case we use
`extrapolation_value` to extrapolate the input image values.”
box_indA 1-D tensor of shape `[num_boxes]` with int32 values in `[0, batch)`.
The value of `box_ind[i]` specifies the image that the `i`-th box refers to.ō
	crop_sizeäA 1-D tensor of 2 elements, `size = [crop_height, crop_width]`. All
cropped image patches are resized to this size. The aspect ratio of the image
content is not preserved. Both `crop_height` and `crop_width` need to be
positive.O
cropsDA 4-D tensor of shape `[num_boxes, crop_height, crop_width, depth]`."
Ttype:

2	"
methodstring
bilinear"SA string specifying the interpolation method. Only 'bilinear' is
supported for now.:

bilinear"S
extrapolation_valuefloat%    ".Value used for extrapolation, when applicable.*PExtracts crops from the input image tensor and bilinearly resizes them (possibly2with aspect ratio change) to a common output size specified by `crop_size`. This
is more general than the `crop_to_bounding_box` op which extracts a fixed size
slice from the input image and does not allow resizing or aspect ratio change.

Returns a tensor with `crops` from the input `image` at positions defined at the
bounding box locations in `boxes`. The cropped boxes are all resized (with
bilinear interpolation) to a fixed `size = [crop_height, crop_width]`. The
result is a 4-D tensor `[num_boxes, crop_height, crop_width, depth]`.

CropAndResizeGradBoxesO
gradsDA 4-D tensor of shape `[num_boxes, crop_height, crop_width, depth]`.
image}A 4-D tensor of shape `[batch, image_height, image_width, depth]`.
Both `image_height` and `image_width` need to be positive."TĢ
boxesĄA 2-D tensor of shape `[num_boxes, 4]`. The `i`-th row of the tensor
specifies the coordinates of a box in the `box_ind[i]` image and is specified
in normalized coordinates `[y1, x1, y2, x2]`. A normalized coordinate value of
`y` is mapped to the image coordinate at `y * (image_height - 1)`, so as the
`[0, 1]` interval of normalized image height is mapped to
`[0, image_height - 1] in image height coordinates. We do allow y1 > y2, in
which case the sampled crop is an up-down flipped version of the original
image. The width dimension is treated similarly. Normalized coordinates
outside the `[0, 1]` range are allowed, in which case we use
`extrapolation_value` to extrapolate the input image values.”
box_indA 1-D tensor of shape `[num_boxes]` with int32 values in `[0, batch)`.
The value of `box_ind[i]` specifies the image that the `i`-th box refers to.3
output'A 2-D tensor of shape `[num_boxes, 4]`."
Ttype:

2	"
methodstring
bilinear"SA string specifying the interpolation method. Only 'bilinear' is
supported for now.:

bilinear*KComputes the gradient of the crop_and_resize op wrt the input boxes tensor.
Å
CropAndResizeGradImageO
gradsDA 4-D tensor of shape `[num_boxes, crop_height, crop_width, depth]`.Ģ
boxesĄA 2-D tensor of shape `[num_boxes, 4]`. The `i`-th row of the tensor
specifies the coordinates of a box in the `box_ind[i]` image and is specified
in normalized coordinates `[y1, x1, y2, x2]`. A normalized coordinate value of
`y` is mapped to the image coordinate at `y * (image_height - 1)`, so as the
`[0, 1]` interval of normalized image height is mapped to
`[0, image_height - 1] in image height coordinates. We do allow y1 > y2, in
which case the sampled crop is an up-down flipped version of the original
image. The width dimension is treated similarly. Normalized coordinates
outside the `[0, 1]` range are allowed, in which case we use
`extrapolation_value` to extrapolate the input image values.”
box_indA 1-D tensor of shape `[num_boxes]` with int32 values in `[0, batch)`.
The value of `box_ind[i]` specifies the image that the `i`-th box refers to.³

image_size¢A 1-D tensor with value `[batch, image_height, image_width, depth]`
containing the original image size. Both `image_height` and `image_width` need
to be positive.O
outputBA 4-D tensor of shape `[batch, image_height, image_width, depth]`."T"
Ttype:
2"
methodstring
bilinear"SA string specifying the interpolation method. Only 'bilinear' is
supported for now.:

bilinear*KComputes the gradient of the crop_and_resize op wrt the input image tensor.
Ū
Cross.
a&A tensor containing 3-element vectors."T6
b.Another tensor, of same type and shape as `a`."TC
product5Pairwise cross product of the vectors in `a` and `b`."T"
Ttype:
2		*#Compute the pairwise cross product.2å`a` and `b` must be the same shape; they can either be simple 3-element vectors,
or any shape where the innermost dimension is 3. In the latter case, each pair
of corresponding 3-element vectors is cross-multiplied independently.
Ģ
Cumprod
x"T
axis"Tidx
out"T"
	exclusivebool( "
reversebool( "
Ttype:
2	"
Tidxtype0:
2	*>Compute the cumulative product of the tensor `x` along `axis`.2ūBy default, this op performs an inclusive cumprod, which means that the first
element of the input is identical to the first element of the output:
```prettyprint
tf.cumprod([a, b, c]) ==> [a, a * b, a * b * c]
```

By setting the `exclusive` kwarg to `True`, an exclusive cumprod is
performed instead:
```prettyprint
tf.cumprod([a, b, c], exclusive=True) ==> [0, a, a * b]
```

By setting the `reverse` kwarg to `True`, the cumprod is performed in the
opposite direction:
```prettyprint
tf.cumprod([a, b, c], reverse=True) ==> [a * b * c, b * c, c]
```
This is more efficient than using separate `tf.reverse` ops.

The `reverse` and `exclusive` kwargs can also be combined:
```prettyprint
tf.cumprod([a, b, c], exclusive=True, reverse=True) ==> [b * c, c, 0]
```
Ą
Cumsum
x"T
axis"Tidx
out"T"
	exclusivebool( "
reversebool( "
Ttype:
2	"
Tidxtype0:
2	*:Compute the cumulative sum of the tensor `x` along `axis`.2ōBy default, this op performs an inclusive cumsum, which means that the first
element of the input is identical to the first element of the output:
```prettyprint
tf.cumsum([a, b, c]) ==> [a, a + b, a + b + c]
```

By setting the `exclusive` kwarg to `True`, an exclusive cumsum is
performed instead:
```prettyprint
tf.cumsum([a, b, c], exclusive=True) ==> [0, a, a + b]
```

By setting the `reverse` kwarg to `True`, the cumsum is performed in the
opposite direction:
```prettyprint
tf.cumsum([a, b, c], reverse=True) ==> [a + b + c, b + c, c]
```
This is more efficient than using separate `tf.reverse` ops.

The `reverse` and `exclusive` kwargs can also be combined:
```prettyprint
tf.cumsum([a, b, c], exclusive=True, reverse=True) ==> [b + c, c, 0]
```

DebugIdentity-
input!Input tensor, non-Reference type."T8
output+Output tensor that equals the input tensor."T"	
Ttype"4
tensor_namestring "Name of the input tensor."t

debug_urlslist(string)
 "TList of URLs to debug targets, e.g.,
file:///foo/tfdbg_dump, grpc:://localhost:11011*Debug Identity Op.2LProvides an identity mapping of the non-Ref type input tensor for debugging.

DebugNanCount-
input!Input tensor, non-Reference type."TM
outputAAn integer output tensor that is the number of NaNs in the input.	"	
Ttype"4
tensor_namestring "Name of the input tensor."t

debug_urlslist(string)
 "TList of URLs to debug targets, e.g.,
file:///foo/tfdbg_dump, grpc:://localhost:11011*Debug NaN Value Counter Op29Counts number of NaNs in the input tensor, for debugging.
»	
DebugNumericSummary>
input2Input tensor, non-Reference type, float or double."TÅ
outputøA double tensor of shape [12], the elements of which are:
  [0]: is initialized (1.0) or not (0.0).
  [1]: total number of elements
  [2]: -inf count
  [3]: negative element count (excluding -inf)
  [4]: zero element count
  [5]: positive element count (excluding +inf)
  [6]: +inf element count
  [7]: NaN element count
Output elements [1:8] are all zero, if the tensor is uninitialized.
  [8]: minimum of all non-inf and non-NaN elements.
       If uninitialized or no such element exists: +inf.
  [9]: maximum of all non-inf and non-NaN elements.
       If uninitialized or no such element exists: -inf.
  [10]: mean of all non-inf and non-NaN elements.
        If uninitialized or no such element exists: NaN.
  [11]: variance of all non-inf and non-NaN elements.
        If uninitialized or no such element exists: NaN."	
Ttype"4
tensor_namestring "Name of the input tensor."t

debug_urlslist(string)
 "TList of URLs to debug targets, e.g.,
file:///foo/tfdbg_dump, grpc:://localhost:11011*Debug Numeric Summary Op.2GProvide a basic summary of numeric value types, range and distribution.

DecodeBase64$
inputBase64 strings to decode.
outputDecoded strings.*'Decode web-safe base64-encoded strings.2Input may or may not have padding at the end. See EncodeBase64 for padding.
Web-safe means that input must use - and _ instead of + and /.
¤
	DecodeCSV`
recordsSEach string is a record/row in the csv and all records should have
the same format.
record_defaultsOne tensor per column of the input record, with either a
scalar default value for that column or empty if the column is required.2OUT_TYPED
output0Each tensor will have the same shape as records.2OUT_TYPE"$
OUT_TYPE
list(type)(0:
2	"E
field_delimstring,")delimiter to separate fields in a record.*?Convert CSV records to tensors. Each column maps to one tensor.2RFC 4180 format is expected for the CSV records.
(https://tools.ietf.org/html/rfc4180)
Note that we allow leading and trailing spaces with int or float field.
Ż
	DecodeGif*
contents0-D.  The GIF-encoded image.E
image:4-D with shape `[num_frames, height, width, 3]`. RGB order*@Decode the first frame of a GIF-encoded image to a uint8 tensor.2GIF with frame or transparency compression are not supported
convert animated GIF from compressed to uncompressed by:

convert $src.gif -coalesce $dst.gif

DecodeJSONExamplen
json_examples[Each string is a JSON object serialized according to the JSON
mapping of the Example proto.
binary_exampleskEach string is a binary Example protocol buffer corresponding
to the respective element of `json_examples`.*GConvert JSON-encoded Example records to binary protocol buffer strings.2æThis op translates a tensor containing Example records, encoded using
the [standard JSON
mapping](https://developers.google.com/protocol-buffers/docs/proto3#json),
into a tensor containing the same records encoded as binary protocol
buffers. The resulting tensor can then be fed to any of the other
Example-parsing ops.
”

DecodeJpeg+
contents0-D.  The JPEG-encoded image.7
image,3-D with shape `[height, width, channels]`.."D
channelsint "/Number of color channels for the decoded image."$
ratioint"Downscaling ratio."m
fancy_upscalingbool("PIf true use a slower but nicer upscaling of the
chroma planes (yuv420/422 only)."X
try_recover_truncatedbool( "5If true try to recover an image from truncated input."q
acceptable_fractionfloat%  ?"LThe minimum required fraction of lines before a truncated
input is accepted."Ó

dct_methodstring "østring specifying a hint about the algorithm used for
decompression.  Defaults to "" which maps to a system-specific
default.  Currently valid values are ["INTEGER_FAST",
"INTEGER_ACCURATE"].  The hint may be ignored (e.g., the internal
jpeg library changes to a version that does not have that specific
option.)*.Decode a JPEG-encoded image to a uint8 tensor.2žThe attr `channels` indicates the desired number of color channels for the
decoded image.

Accepted values are:

*   0: Use the number of channels in the JPEG-encoded image.
*   1: output a grayscale image.
*   3: output an RGB image.

If needed, the JPEG-encoded image is transformed to match the requested number
of color channels.

The attr `ratio` allows downscaling the image by an integer factor during
decoding.  Allowed values are: 1, 2, 4, and 8.  This is much faster than
downscaling the image later.
ł
	DecodePng*
contents0-D.  The PNG-encoded image.;
image+3-D with shape `[height, width, channels]`."dtype"D
channelsint "/Number of color channels for the decoded image."
dtypetype0:
2*7Decode a PNG-encoded image to a uint8 or uint16 tensor.2čThe attr `channels` indicates the desired number of color channels for the
decoded image.

Accepted values are:

*   0: Use the number of channels in the PNG-encoded image.
*   1: output a grayscale image.
*   3: output an RGB image.
*   4: output an RGBA image.

If needed, the PNG-encoded image is transformed to match the requested number
of color channels.

	DecodeRaw6
bytes+All the elements must have the same length.Ų
outputĆA Tensor with one more dimension than the input `bytes`.  The
added dimension will have size equal to the length of the elements
of `bytes` divided by the number of bytes to represent `out_type`."out_type"
out_typetype:

2	"
little_endianbool("Whether the input `bytes` are in little-endian order.
Ignored for `out_type` values that are stored in a single byte like
`uint8`.*9Reinterpret the bytes of a string as a vector of numbers.

DeleteSessionTensor@
handle4The handle for a tensor stored in the session state.*9Delete the tensor specified by its handle in the session.
Ö	
DenseToDenseSetOperation 
set1`Tensor` with rank `n`. 1st `n-1` dimensions must be the same as `set2`.
Dimension `n` contains values in a set, duplicates are allowed but ignored."T 
set2`Tensor` with rank `n`. 1st `n-1` dimensions must be the same as `set1`.
Dimension `n` contains values in a set, duplicates are allowed but ignored."T3
result_indices2D indices of a `SparseTensor`.	2
result_values1D values of a `SparseTensor`."TŻ
result_shapeŹ1D `Tensor` shape of a `SparseTensor`. `result_shape[0...n-1]` is
the same as the 1st `n-1` dimensions of `set1` and `set2`, `result_shape[n]`
is the max result set size across all `0...n-1` dimensions.	"
set_operationstring"
validate_indicesbool("
Ttype:
	2	*@Applies set operation along last dimension of 2 `Tensor` inputs.2See SetOperationOp::SetOperationFromContext for values of `set_operation`.

Output `result` is a `SparseTensor` represented by `result_indices`,
`result_values`, and `result_shape`. For `set1` and `set2` ranked `n`, this
has rank `n` and the same 1st `n-1` dimensions as `set1` and `set2`. The `nth`
dimension contains the result of `set_operation` applied to the corresponding
`[0...n-1]` dimension of `set`.

DenseToSparseSetOperation 
set1`Tensor` with rank `n`. 1st `n-1` dimensions must be the same as `set2`.
Dimension `n` contains values in a set, duplicates are allowed but ignored."TW
set2_indicesE2D `Tensor`, indices of a `SparseTensor`. Must be in row-major
order.	V
set2_valuesD1D `Tensor`, values of a `SparseTensor`. Must be in row-major
order."TÅ

set2_shape“1D `Tensor`, shape of a `SparseTensor`. `set2_shape[0...n-1]` must
be the same as the 1st `n-1` dimensions of `set1`, `result_shape[n]` is the
max set size across `n-1` dimensions.	3
result_indices2D indices of a `SparseTensor`.	2
result_values1D values of a `SparseTensor`."TŻ
result_shapeŹ1D `Tensor` shape of a `SparseTensor`. `result_shape[0...n-1]` is
the same as the 1st `n-1` dimensions of `set1` and `set2`, `result_shape[n]`
is the max result set size across all `0...n-1` dimensions.	"
set_operationstring"
validate_indicesbool("
Ttype:
	2	*JApplies set operation along last dimension of `Tensor` and `SparseTensor`.2źSee SetOperationOp::SetOperationFromContext for values of `set_operation`.

Input `set2` is a `SparseTensor` represented by `set2_indices`, `set2_values`,
and `set2_shape`. For `set2` ranked `n`, 1st `n-1` dimensions must be the same
as `set1`. Dimension `n` contains values in a set, duplicates are allowed but
ignored.

If `validate_indices` is `True`, this op validates the order and range of `set2`
indices.

Output `result` is a `SparseTensor` represented by `result_indices`,
`result_values`, and `result_shape`. For `set1` and `set2` ranked `n`, this
has rank `n` and the same 1st `n-1` dimensions as `set1` and `set2`. The `nth`
dimension contains the result of `set_operation` applied to the corresponding
`[0...n-1]` dimension of `set`.
Č
DepthToSpace

input"T
output"T"	
Ttype"M

block_sizeint"6The size of the spatial block, same as in Space2Depth.(0*#DepthToSpace for tensors of type T.2Rearranges data from depth into blocks of spatial data.
This is the reverse transformation of SpaceToDepth. More specifically,
this op outputs a copy of the input tensor where values from the `depth`
dimension are moved in spatial blocks to the `height` and `width` dimensions.
The attr `block_size` indicates the input block size and how the data is moved.

  * Chunks of data of size `block_size * block_size` from depth are rearranged
    into non-overlapping blocks of size `block_size x block_size`
  * The width the output tensor is `input_depth * block_size`, whereas the
    height is `input_height * block_size`.
  * The depth of the input tensor must be divisible by
    `block_size * block_size`.

That is, assuming the input is in the shape:
`[batch, height, width, depth]`,
the shape of the output will be:
`[batch, height*block_size, width*block_size, depth/(block_size*block_size)]`

This operation requires that the input tensor be of rank 4, and that
`block_size` be >=1 and that `block_size * block_size` be a divisor of the
input depth.

This operation is useful for resizing the activations between convolutions
(but keeping all data), e.g. instead of pooling. It is also useful for training
purely convolutional models.

For example, given this input of shape `[1, 1, 1, 4]`, and a block size of 2:

```prettyprint
x = [[[[1, 2, 3, 4]]]]

```

This operation will output a tensor of shape `[1, 2, 2, 1]`:

```prettyprint
   [[[[1], [2]],
     [[3], [4]]]]
```

Here, the input has a batch of 1 and each batch element has shape `[1, 1, 4]`,
the corresponding output will have 2x2 elements and will have a depth of
1 channel (1 = `4 / (block_size * block_size)`).
The output element shape is `[2, 2, 1]`.

For an input tensor with larger depth, here of shape `[1, 1, 1, 12]`, e.g.

```prettyprint
x = [[[[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]]]]
```

This operation, for block size of 2, will return the following tensor of shape
`[1, 2, 2, 3]`

```prettyprint
   [[[[1, 2, 3], [4, 5, 6]],
     [[7, 8, 9], [10, 11, 12]]]]

```

Similarly, for the following input of shape `[1 2 2 4]`, and a block size of 2:

```prettyprint
x =  [[[[1, 2, 3, 4],
       [5, 6, 7, 8]],
      [[9, 10, 11, 12],
       [13, 14, 15, 16]]]]
```

the operator will return the following tensor of shape `[1 4 4 1]`:

```prettyprint
x = [[ [1],   [2],  [5],  [6]],
     [ [3],   [4],  [7],  [8]],
     [ [9],  [10], [13],  [14]],
     [ [11], [12], [15],  [16]]]

```
³	
DepthwiseConv2dNative

input"T
filter"T
output"T"
Ttype:
2"g
strides	list(int)"Q1-D of length 4.  The stride of the sliding window for each dimension
of `input`."I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*LComputes a 2-D depthwise convolution given 4-D `input` and `filter` tensors.2ŽGiven an input tensor of shape `[batch, in_height, in_width, in_channels]`
and a filter / kernel tensor of shape
`[filter_height, filter_width, in_channels, channel_multiplier]`, containing
`in_channels` convolutional filters of depth 1, `depthwise_conv2d` applies
a different filter to each input channel (expanding from 1 channel to
`channel_multiplier` channels for each), then concatenates the results
together. Thus, the output has `in_channels * channel_multiplier` channels.

for k in 0..in_channels-1
  for q in 0..channel_multiplier-1
    output[b, i, j, k * channel_multiplier + q] =
      sum_{di, dj} input[b, strides[1] * i + di, strides[2] * j + dj, k] *
                        filter[di, dj, k, q]

Must have `strides[0] = strides[3] = 1`.  For the most common case of the same
horizontal and vertices strides, `strides = [1, stride, stride, 1]`.
Ń
#DepthwiseConv2dNativeBackpropFilterG
input;4-D with shape `[batch, in_height, in_width, in_channels]`."T²
filter_sizesAn integer vector representing the tensor shape of `filter`,
where `filter` is a 4-D
`[filter_height, filter_width, in_channels, depthwise_multiplier]` tensor.
out_backpropn4-D with shape `[batch, out_height, out_width, out_channels]`.
Gradients w.r.t. the output of the convolution."T
output4-D with shape
`[filter_height, filter_width, in_channels, out_channels]`.  Gradient w.r.t.
the `filter` input of the convolution."T"
Ttype:
2"j
strides	list(int)"TThe stride of the sliding window for each dimension of the input
of the convolution."I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*KComputes the gradients of depthwise convolution with respect to the filter.
¢
"DepthwiseConv2dNativeBackpropInput
input_sizesvAn integer vector representing the shape of `input`,
where `input` is a 4-D `[batch, height, width, channels]` tensor._
filterR4-D with shape
`[filter_height, filter_width, in_channels, depthwise_multiplier]`."T
out_backpropn4-D with shape `[batch, out_height, out_width, out_channels]`.
Gradients w.r.t. the output of the convolution."Tw
outputj4-D with shape `[batch, in_height, in_width, in_channels]`.  Gradient
w.r.t. the input of the convolution."T"
Ttype:
2"j
strides	list(int)"TThe stride of the sliding window for each dimension of the input
of the convolution."I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*JComputes the gradients of depthwise convolution with respect to the input.
Ė

Dequantize

input"TH
	min_range9The minimum scalar value possibly produced for the input.H
	max_range9The maximum scalar value possibly produced for the input.

output"
Ttype:	
2";
modestringMIN_COMBINED:
MIN_COMBINED	MIN_FIRST*2Dequantize the 'input' tensor into a float Tensor.2
[min_range, max_range] are scalar floats that specify the range for
the 'input' data. The 'mode' attribute controls exactly which calculations are
used to convert the float values to their quantized equivalents.

In 'MIN_COMBINED' mode, each value of the tensor will undergo the following:

```
if T == qint8, in[i] += (range(T) + 1)/ 2.0
out[i] = min_range + (in[i]* (max_range - min_range) / range(T))
```
here `range(T) = numeric_limits<T>::max() - numeric_limits<T>::min()`

*MIN_COMBINED Mode Example*

If the input comes from a QuantizedRelu6, the output type is
quint8 (range of 0-255) but the possible range of QuantizedRelu6 is
0-6.  The min_range and max_range values are therefore 0.0 and 6.0.
Dequantize on quint8 will take each value, cast to float, and multiply
by 6 / 255.
Note that if quantizedtype is qint8, the operation will additionally add
each value by 128 prior to casting.

If the mode is 'MIN_FIRST', then this approach is used:

```
number_of_steps = 1 << (# of bits in T)
range_adjust = number_of_steps / (number_of_steps - 1)
range = (range_max - range_min) * range_adjust
range_scale = range / number_of_steps
const double offset_input = static_cast<double>(input) - lowest_quantized;
result = range_min + ((input - numeric_limits<T>::min()) * range_scale)
```
Ž
DeserializeManySparse[
serialized_sparseD2-D, The `N` serialized `SparseTensor` objects.
Must have 3 columns.
sparse_indices	
sparse_values"dtype
sparse_shape	"D
dtypetype"5The `dtype` of the serialized `SparseTensor` objects.*HDeserialize and concatenate `SparseTensors` from a serialized minibatch.2
The input `serialized_sparse` must be a string matrix of shape `[N x 3]` where
`N` is the minibatch size and the rows correspond to packed outputs of
`SerializeSparse`.  The ranks of the original `SparseTensor` objects
must all match.  When the final `SparseTensor` is created, it has rank one
higher than the ranks of the incoming `SparseTensor` objects
(they have been concatenated along a new row dimension).

The output `SparseTensor` object's shape values for all dimensions but the
first are the max across the input `SparseTensor` objects' shape values
for the corresponding dimensions.  Its first shape value is `N`, the minibatch
size.

The input `SparseTensor` objects' indices are assumed ordered in
standard lexicographic order.  If this is not the case, after this
step run `SparseReorder` to restore index ordering.

For example, if the serialized input is a `[2 x 3]` matrix representing two
original `SparseTensor` objects:

    index = [ 0]
            [10]
            [20]
    values = [1, 2, 3]
    shape = [50]

and

    index = [ 2]
            [10]
    values = [4, 5]
    shape = [30]

then the final deserialized `SparseTensor` will be:

    index = [0  0]
            [0 10]
            [0 20]
            [1  2]
            [1 10]
    values = [1, 2, 3, 4, 5]
    shape = [2 50]
ń
DestroyTemporaryVariable:
ref-A reference to the temporary variable tensor."T

value"T"	
Ttype"l
var_namestring"XName of the temporary variable, usually the name of the matching
'TemporaryVariable' op.*<Destroys the temporary variable and returns its final value.2ÕSets output to the value of the Tensor pointed to by 'ref', then destroys
the temporary variable called 'var_name'.
All other uses of 'ref' *must* have executed before this op.
This is typically achieved by chaining the ref through each assign op, or by
using control dependencies.

Outputs the final value of the tensor pointed to by 'ref'.
Õ
Diag2
diagonal#Rank k tensor where k is at most 3."T
output"T"
Ttype:

2	*7Returns a diagonal tensor with a given diagonal values.2»Given a `diagonal`, this operation returns a tensor with the `diagonal` and
everything else padded with zeros. The diagonal is computed as follows:

Assume `diagonal` has dimensions [D1,..., Dk], then the output is a tensor of
rank 2k with dimensions [D1,..., Dk, D1,..., Dk] where:

`output[i1,..., ik, i1,..., ik] = diagonal[i1, ..., ik]` and 0 everywhere else.

For example:

```prettyprint
# 'diagonal' is [1, 2, 3, 4]
tf.diag(diagonal) ==> [[1, 0, 0, 0]
                       [0, 2, 0, 0]
                       [0, 0, 3, 0]
                       [0, 0, 0, 4]]
```

DiagPart0
input$Rank k tensor where k is 2, 4, or 6."T&
diagonalThe extracted diagonal."T"
Ttype:

2	*(Returns the diagonal part of the tensor.2ģThis operation returns a tensor with the `diagonal` part
of the `input`. The `diagonal` part is computed as follows:

Assume `input` has dimensions `[D1,..., Dk, D1,..., Dk]`, then the output is a
tensor of rank `k` with dimensions `[D1,..., Dk]` where:

`diagonal[i1,..., ik] = input[i1, ..., ik, i1,..., ik]`.

For example:

```prettyprint
# 'input' is [[1, 0, 0, 0]
              [0, 2, 0, 0]
              [0, 0, 3, 0]
              [0, 0, 0, 4]]

tf.diag_part(input) ==> [1, 2, 3, 4]
```

Digamma
x"T
y"T"
Ttype:
2*HComputes Psi, the derivative of Lgamma (the log of the absolute value of2`Gamma(x)`), element-wise.
Ó

Dilation2DA
input54-D with shape `[batch, in_height, in_width, depth]`."TC
filter63-D with shape `[filter_height, filter_width, depth]`."TD
output74-D with shape `[batch, out_height, out_width, depth]`."T"
Ttype:
2		"
strides	list(int)"xThe stride of the sliding window for each dimension of the input
tensor. Must be: `[1, stride_height, stride_width, 1]`.(0"w
rates	list(int)"_The input stride for atrous morphological dilation. Must be:
`[1, rate_height, rate_width, 1]`.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*HComputes the grayscale dilation of 4-D `input` and 3-D `filter` tensors.2¹The `input` tensor has shape `[batch, in_height, in_width, depth]` and the
`filter` tensor has shape `[filter_height, filter_width, depth]`, i.e., each
input channel is processed independently of the others with its own structuring
function. The `output` tensor has shape
`[batch, out_height, out_width, depth]`. The spatial dimensions of the output
tensor depend on the `padding` algorithm. We currently only support the default
"NHWC" `data_format`.

In detail, the grayscale morphological 2-D dilation is the max-sum correlation
(for consistency with `conv2d`, we use unmirrored filters):

    output[b, y, x, c] =
       max_{dy, dx} input[b,
                          strides[1] * y + rates[1] * dy,
                          strides[2] * x + rates[2] * dx,
                          c] +
                    filter[dy, dx, c]

Max-pooling is a special case when the filter has size equal to the pooling
kernel size and contains all zeros.

Note on duality: The dilation of `input` by the `filter` is equal to the
negation of the erosion of `-input` by the reflected `filter`.
¤
Dilation2DBackpropFilterA
input54-D with shape `[batch, in_height, in_width, depth]`."TC
filter63-D with shape `[filter_height, filter_width, depth]`."TJ
out_backprop74-D with shape `[batch, out_height, out_width, depth]`."TL
filter_backprop63-D with shape `[filter_height, filter_width, depth]`."T"
Ttype:
2		"¤
strides	list(int)"1-D of length 4. The stride of the sliding window for each dimension of
the input tensor. Must be: `[1, stride_height, stride_width, 1]`.(0"
rates	list(int)"p1-D of length 4. The input stride for atrous morphological dilation.
Must be: `[1, rate_height, rate_width, 1]`.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*OComputes the gradient of morphological 2-D dilation with respect to the filter.

Dilation2DBackpropInputA
input54-D with shape `[batch, in_height, in_width, depth]`."TC
filter63-D with shape `[filter_height, filter_width, depth]`."TJ
out_backprop74-D with shape `[batch, out_height, out_width, depth]`."TG
in_backprop54-D with shape `[batch, in_height, in_width, depth]`."T"
Ttype:
2		"¤
strides	list(int)"1-D of length 4. The stride of the sliding window for each dimension of
the input tensor. Must be: `[1, stride_height, stride_width, 1]`.(0"
rates	list(int)"p1-D of length 4. The input stride for atrous morphological dilation.
Must be: `[1, rate_height, rate_width, 1]`.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*NComputes the gradient of morphological 2-D dilation with respect to the input.
Ū
Div
x"T
y"T
z"T"
Ttype:
2	*Returns x / y element-wise.2*NOTE*: `Div` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)
æ
DrawBoundingBoxesO
imagesB4-D with shape `[batch, height, width, depth]`. A batch of images."TU
boxesJ3-D with shape `[batch, num_bounding_boxes, 4]` containing bounding
boxes.t
outputg4-D with the same shape as `images`. The batch of input images with
bounding boxes drawn on the images."T"
Ttype0:
2*)Draw bounding boxes on a batch of images.2ÉOutputs a copy of `images` but draws on top of the pixels zero or more bounding
boxes specified by the locations in `boxes`. The coordinates of the each
bounding box in `boxes` are encoded as `[y_min, x_min, y_max, x_max]`. The
bounding box coordinates are floats in `[0.0, 1.0]` relative to the width and
height of the underlying image.

For example, if an image is 100 x 200 pixels and the bounding box is
`[0.1, 0.2, 0.5, 0.9]`, the bottom-left and upper-right coordinates of the
bounding box will be `(10, 40)` to `(50, 180)`.

Parts of the bounding box may fall outside the image.
½

DynamicPartition	
data"TG

partitions7Any shape.  Indices in the range `[0, num_partitions)`.
outputs"T*num_partitions">
num_partitionsint"#The number of partitions to output.(0"	
Ttype*PPartitions `data` into `num_partitions` tensors using indices from `partitions`.2For each index tuple `js` of size `partitions.ndim`, the slice `data[js, ...]`
becomes part of `outputs[partitions[js]]`.  The slices with `partitions[js] = i`
are placed in `outputs[i]` in lexicographic order of `js`, and the first
dimension of `outputs[i]` is the number of entries in `partitions` equal to `i`.
In detail,

```python
    outputs[i].shape = [sum(partitions == i)] + data.shape[partitions.ndim:]

    outputs[i] = pack([data[js, ...] for js if partitions[js] == i])
```

`data.shape` must start with `partitions.shape`.

For example:

```python
    # Scalar partitions.
    partitions = 1
    num_partitions = 2
    data = [10, 20]
    outputs[0] = []  # Empty with shape [0, 2]
    outputs[1] = [[10, 20]]

    # Vector partitions.
    partitions = [0, 0, 1, 1, 0]
    num_partitions = 2
    data = [10, 20, 30, 40, 50]
    outputs[0] = [10, 20, 50]
    outputs[1] = [30, 40]
```

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/DynamicPartition.png" alt>
</div>

DynamicStitch
indices*N
data"T*N
merged"T"
Nint(0"	
Ttype*CInterleave the values from the `data` tensors into a single tensor.2ö	Builds a merged tensor such that

```python
    merged[indices[m][i, ..., j], ...] = data[m][i, ..., j, ...]
```

For example, if each `indices[m]` is scalar or vector, we have

```python
    # Scalar indices:
    merged[indices[m], ...] = data[m][...]

    # Vector indices:
    merged[indices[m][i], ...] = data[m][i, ...]
```

Each `data[i].shape` must start with the corresponding `indices[i].shape`,
and the rest of `data[i].shape` must be constant w.r.t. `i`.  That is, we
must have `data[i].shape = indices[i].shape + constant`.  In terms of this
`constant`, the output shape is

    merged.shape = [max(indices)] + constant

Values are merged in order, so if an index appears in both `indices[m][i]` and
`indices[n][j]` for `(m,i) < (n,j)` the slice `data[n][j]` will appear in the
merged result.

For example:

```python
    indices[0] = 6
    indices[1] = [4, 1]
    indices[2] = [[5, 2], [0, 3]]
    data[0] = [61, 62]
    data[1] = [[41, 42], [11, 12]]
    data[2] = [[[51, 52], [21, 22]], [[1, 2], [31, 32]]]
    merged = [[1, 2], [11, 12], [21, 22], [31, 32], [41, 42],
              [51, 52], [61, 62]]
```

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/DynamicStitch.png" alt>
</div>
Ō
EditDistanceg
hypothesis_indicesOThe indices of the hypothesis list SparseTensor.
This is an N x R int64 matrix.	c
hypothesis_valuesKThe values of the hypothesis list SparseTensor.
This is an N-length vector."T`
hypothesis_shapeJThe shape of the hypothesis list SparseTensor.
This is an R-length vector.	]
truth_indicesJThe indices of the truth list SparseTensor.
This is an M x R int64 matrix.	Y
truth_valuesFThe values of the truth list SparseTensor.
This is an M-length vector."T'
truth_shapetruth indices, vector.	µ
outputØA dense float tensor with rank R - 1.

For the example input:

    // hypothesis represents a 2x1 matrix with variable-length values:
    //   (0,0) = ["a"]
    //   (1,0) = ["b"]
    hypothesis_indices = [[0, 0, 0],
                          [1, 0, 0]]
    hypothesis_values = ["a", "b"]
    hypothesis_shape = [2, 1, 1]

    // truth represents a 2x2 matrix with variable-length values:
    //   (0,0) = []
    //   (0,1) = ["a"]
    //   (1,0) = ["b", "c"]
    //   (1,1) = ["a"]
    truth_indices = [[0, 1, 0],
                     [1, 0, 0],
                     [1, 0, 1],
                     [1, 1, 0]]
    truth_values = ["a", "b", "c", "a"]
    truth_shape = [2, 2, 2]
    normalize = true

The output will be:

    // output is a 2x2 matrix with edit distances normalized by truth lengths.
    output = [[inf, 1.0],  // (0,0): no truth, (0,1): no hypothesis
              [0.5, 1.0]]  // (1,0): addition, (1,1): no hypothesis"k
	normalizebool("Tboolean (if true, edit distances are normalized by length of truth).

The output is:"	
Ttype*=Computes the (possibly normalized) Levenshtein Edit Distance.2ĮThe inputs are variable-length sequences provided by SparseTensors
  (hypothesis_indices, hypothesis_values, hypothesis_shape)
and
  (truth_indices, truth_values, truth_shape).

The inputs are:

Elu
features"T
activations"T"
Ttype:
2		*NComputes exponential linear: `exp(features) - 1` if < 0, `features` otherwise.2rSee [Fast and Accurate Deep Network Learning by Exponential Linear Units (ELUs)
](http://arxiv.org/abs/1511.07289)
×
EluGradP
	gradients@The backpropagated gradients to the corresponding Elu operation."T=
outputs/The outputs of the corresponding Elu operation."Ta
	backpropsQThe gradients: `gradients * (outputs + 1)` if outputs < 0,
`gradients` otherwise."T"
Ttype:
2		*>Computes gradients for the exponential linear (Elu) operation.
ü
EncodeBase64!
inputStrings to be encoded.,
output Input strings encoded in base64."=
padbool( ",Bool whether padding is applied at the ends.*+Encode strings into web-safe base64 format.2®Refer to the following article for more information on base64 format:
en.wikipedia.org/wiki/Base64. Base64 strings may have padding with '=' at the
end so that the encoded has length multiple of 4. See Padding section of the
link above.

Web-safe means that the encoder uses - and _ instead of + and /.


EncodeJpeg6
image+3-D with shape `[height, width, channels]`.&
contents0-D. JPEG-encoded image."C
formatstring "Per pixel image format.:
 	grayscalergb"[
qualityint_"GQuality of the compression from 0 to 100 (higher is better and slower)."Z
progressivebool( "AIf True, create a JPEG that loads progressively (coarse to fine)."X
optimize_sizebool( "=If True, spend CPU/RAM to reduce size with no quality change."U
chroma_downsamplingbool("4See http://en.wikipedia.org/wiki/Chroma_subsampling."
density_unitstringin"bUnit used to specify `x_density` and `y_density`:
pixels per inch (`'in'`) or centimeter (`'cm'`).:

incm":
	x_densityint¬"#Horizontal pixels per density unit."8
	y_densityint¬"!Vertical pixels per density unit."V
xmp_metadatastring ":If not empty, embed this XMP metadata in the image header.*JPEG-encode an image.2ń`image` is a 3-D uint8 Tensor of shape `[height, width, channels]`.

The attr `format` can be used to override the color format of the encoded
output.  Values can be:

*   `''`: Use a default format based on the number of channels in the image.
*   `grayscale`: Output a grayscale JPEG image.  The `channels` dimension
    of `image` must be 1.
*   `rgb`: Output an RGB JPEG image. The `channels` dimension
    of `image` must be 3.

If `format` is not specified or is the empty string, a default format is picked
in function of the number of channels in `image`:

*   1: Output a grayscale image.
*   3: Output an RGB image.
Å
	EncodePng7
image+3-D with shape `[height, width, channels]`."T%
contents0-D. PNG-encoded image."3
compressionint’’’’’’’’’"Compression level."
Ttype0:
2*PNG-encode an image.2õ`image` is a 3-D uint8 or uint16 Tensor of shape `[height, width, channels]`
where `channels` is:

*   1: for grayscale.
*   2: for grayscale + alpha.
*   3: for RGB.
*   4: for RGBA.

The ZLIB compression level, `compression`, can be -1 for the PNG-encoder
default or a value from 0 to 9.  9 is the highest compression level, generating
the smallest output, but is slower.
ų
Enter>
data3The tensor to be made available to the child frame."T'
outputThe same tensor as `data`."T"	
Ttype"2

frame_namestring"The name of the child frame."P
is_constantbool( "7If true, the output is constant within the child frame."T
parallel_iterationsint
"4The number of iterations allowed to run in parallel.*NCreates or finds a child frame, and makes `data` available to the child frame.2ĪThis op is used together with `Exit` to create loops in the graph.
The unique `frame_name` is used by the `Executor` to identify frames. If
`is_constant` is true, `output` is a constant in the child frame; otherwise
it may be changed in the child frame. At most `parallel_iterations` iterations
are run in parallel in the child frame.
ū
Equal
x"T
y"T
z
"
Ttype:
2	
*1Returns the truth value of (x == y) element-wise.2*NOTE*: `Equal` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)
a
Erf
x"T
y"T"
Ttype:
2*6Computes the Gauss error function of `x` element-wise.
j
Erfc
x"T
y"T"
Ttype:
2*>Computes the complementary error function of `x` element-wise.
å
Exit?
data4The tensor to be made available to the parent frame."T'
outputThe same tensor as `data`."T"	
Ttype*,Exits the current frame to its parent frame.2:Exit makes its input `data` available to the parent frame.
d
Exp
x"T
y"T"
Ttype:	
2*7Computes exponential of x element-wise.  \\(y = e^x\\).
ø


ExpandDims

input"Ta
dimT0-D (scalar). Specifies the dimension index at which to
expand the shape of `input`."Tdimj
output]Contains the same data as `input`, but its shape has an additional
dimension of size 1 added."T"	
Ttype"
Tdimtype0:
2	*/Inserts a dimension of 1 into a tensor's shape.2ųGiven a tensor `input`, this operation inserts a dimension of 1 at the
dimension index `dim` of `input`'s shape. The dimension index `dim` starts at
zero; if you specify a negative number for `dim` it is counted backward from
the end.

This operation is useful if you want to add a batch dimension to a single
element. For example, if you have a single image of shape `[height, width,
channels]`, you can make it a batch of 1 image with `expand_dims(image, 0)`,
which will make the shape `[1, height, width, channels]`.

Other examples:

```prettyprint
# 't' is a tensor of shape [2]
shape(expand_dims(t, 0)) ==> [1, 2]
shape(expand_dims(t, 1)) ==> [2, 1]
shape(expand_dims(t, -1)) ==> [2, 1]

# 't2' is a tensor of shape [2, 3, 5]
shape(expand_dims(t2, 0)) ==> [1, 2, 3, 5]
shape(expand_dims(t2, 2)) ==> [2, 3, 1, 5]
shape(expand_dims(t2, 3)) ==> [2, 3, 5, 1]
```

This operation requires that:

`-1-input.dims() <= dim <= input.dims()`

This operation is related to `squeeze()`, which removes dimensions of
size 1.
y
Expm1
x"T
y"T"
Ttype:	
2*+Computes exponential of x - 1 element-wise.2I.e., \\(y = (\exp x) - 1\\).
Ń
ExtractGlimpseO
inputDA 4-D float tensor of shape `[batch_size, height, width, channels]`.¢
sizeA 1-D tensor of 2 elements containing the size of the glimpses
to extract.  The glimpse height must be specified first, following
by the glimpse width.x
offsetskA 2-D integer tensor of shape `[batch_size, 2]` containing
the x, y locations of the center of each window.h
glimpse[A tensor representing the glimpses `[batch_size,
glimpse_height, glimpse_width, channels]`."
centeredbool("ėindicates if the offset coordinates are centered relative to
the image, in which case the (0, 0) offset is relative to the center
of the input images. If false, the (0,0) offset corresponds to the
upper left corner of the input images."K

normalizedbool("3indicates if the offset coordinates are normalized."~
uniform_noisebool("cindicates if the noise should be generated using a
uniform distribution or a Gaussian distribution.*)Extracts a glimpse from the input tensor.2ēReturns a set of windows called glimpses extracted at location
`offsets` from the input tensor. If the windows only partially
overlaps the inputs, the non overlapping areas will be filled with
random noise.

The result is a 4-D tensor of shape `[batch_size, glimpse_height,
glimpse_width, channels]`. The channels and batch dimensions are the
same as that of the input tensor. The height and width of the output
windows are specified in the `size` parameter.

The argument `normalized` and `centered` controls how the windows are built:

* If the coordinates are normalized but not centered, 0.0 and 1.0
  correspond to the minimum and maximum of each height and width
  dimension.
* If the coordinates are both normalized and centered, they range from
  -1.0 to 1.0. The coordinates (-1.0, -1.0) correspond to the upper
  left corner, the lower right corner is located at (1.0, 1.0) and the
  center is at (0, 0).
* If the coordinates are not normalized they are interpreted as
  numbers of pixels.
ū	
ExtractImagePatchesF
images94-D Tensor with shape `[batch, in_rows, in_cols, depth]`."TĶ
patches¾4-D Tensor with shape `[batch, out_rows, out_cols, ksize_rows *
ksize_cols * depth]` containing image patches with size
`ksize_rows x ksize_cols x depth` vectorized in the "depth" dimension."T"W
ksizes	list(int)">The size of the sliding window for each dimension of `images`.(0"
strides	list(int)"1-D of length 4. How far the centers of two consecutive patches are in
the images. Must be: `[1, stride_rows, stride_cols, 1]`.(0"×
rates	list(int)"¾1-D of length 4. Must be: `[1, rate_rows, rate_cols, 1]`. This is the
input stride, specifying how far two consecutive patch samples are in the
input. Equivalent to extracting patches with
`patch_sizes_eff = patch_sizes + (patch_sizes - 1) * (rates - 1)`, followed by
subsampling them spatially by a factor of `rates`.(0"
Ttype:
2		"
paddingstring"īThe type of padding algorithm to use.

We specify the size-related attributes as:

```python
      ksizes = [1, ksize_rows, ksize_cols, 1]
      strides = [1, strides_rows, strides_cols, 1]
      rates = [1, rates_rows, rates_cols, 1]
```:
SAMEVALID*MExtract `patches` from `images` and put them in the "depth" output dimension.

FFT
inputA complex64 tensor.
outputA complex64 tensor of the same shape as `input`. The inner-most
dimension of `input` is replaced with its 1D Fourier Transform.*HCompute the 1-dimensional discrete Fourier Transform over the inner-most2dimension of `input`.
ā
FFT2D
inputA complex64 tensor.Ō
outputĒA complex64 tensor of the same shape as `input`. The inner-most 2
  dimensions of `input` are replaced with their 2D Fourier Transform.

@compatibility(numpy)
Equivalent to np.fft2
@end_compatibility*HCompute the 2-dimensional discrete Fourier Transform over the inner-most22 dimensions of `input`.
ā
FFT3D
inputA complex64 tensor.Ō
outputĒA complex64 tensor of the same shape as `input`. The inner-most 3
  dimensions of `input` are replaced with their 3D Fourier Transform.

@compatibility(numpy)
Equivalent to np.fft3
@end_compatibility*JCompute the 3-dimensional discrete Fourier Transform over the inner-most 32dimensions of `input`.
É
	FIFOQueue'
handleThe handle to the queue."I
component_types
list(type)"&The type of each component in a value.(0"
shapeslist(shape)
 "The shape of each component in a value. The length of this attr must
be either 0 or the same as the length of component_types. If the length of
this attr is 0, the shapes of queue elements are not constrained, and
only one element may be dequeued at a time.("v
capacityint’’’’’’’’’"XThe upper bound on the number of elements in this queue.
Negative numbers mean no limit."{
	containerstring "bIf non-empty, this queue is placed in the given container.
Otherwise, a default container is used."q
shared_namestring "VIf non-empty, this queue will be shared under the given name
across multiple sessions.*;A queue that produces elements in first-in first-out order.
Č
FIFOQueueV2$
handleThe handle to the queue."I
component_types
list(type)"&The type of each component in a value.(0"
shapeslist(shape)
 "The shape of each component in a value. The length of this attr must
be either 0 or the same as the length of component_types. If the length of
this attr is 0, the shapes of queue elements are not constrained, and
only one element may be dequeued at a time.("v
capacityint’’’’’’’’’"XThe upper bound on the number of elements in this queue.
Negative numbers mean no limit."{
	containerstring "bIf non-empty, this queue is placed in the given container.
Otherwise, a default container is used."q
shared_namestring "VIf non-empty, this queue will be shared under the given name
across multiple sessions.*;A queue that produces elements in first-in first-out order.
1
Fact
fact*Output a fact about factorials.
Ī
FakeQuantWithMinMaxArgs

inputs
outputs"
minfloat%  ĄĄ"
maxfloat%  Ą@*OFake-quantize the 'inputs' tensor, type float to 'outputs' tensor of same type.2Attributes [min; max] define the clamping range for the 'inputs' data.  Op
divides this range into 255 steps (total of 256 values), then replaces each
'inputs' value with the closest of the quantized step values.

Quantization is called fake since the output is still in floating point.
³
FakeQuantWithMinMaxArgsGradientT
	gradientsEBackpropagated gradients above the FakeQuantWithMinMaxArgs operation.M
inputsAValues passed as inputs to the FakeQuantWithMinMaxArgs operation.
	backpropsuBackpropagated gradients below the FakeQuantWithMinMaxArgs operation:
`gradients * (inputs >= min && inputs <= max)`."
minfloat%  ĄĄ"
maxfloat%  Ą@*:Compute gradients for a FakeQuantWithMinMaxArgs operation.

FakeQuantWithMinMaxVars

inputs
min
max
outputs*LFake-quantize the 'inputs' tensor of type float and shape `[b, h, w, d]` via2īglobal float scalars `min` and `max` to 'outputs' tensor of same shape as
`inputs`.

[min; max] is the clamping range for the 'inputs' data.  Op divides this range
into 255 steps (total of 256 values), then replaces each 'inputs' value with the
closest of the quantized step values.

This operation has a gradient and thus allows for training `min` and `max` values.

FakeQuantWithMinMaxVarsGradientT
	gradientsEBackpropagated gradients above the FakeQuantWithMinMaxVars operation.}
inputsqValues passed as inputs to the FakeQuantWithMinMaxVars operation.
min, max: Quantization interval, scalar floats.
min
maxp
backprops_wrt_inputWBackpropagated gradients w.r.t. inputs:
`gradients * (inputs >= min && inputs <= max)`.g
backprop_wrt_minQBackpropagated gradients w.r.t. min parameter:
`sum(gradients * (inputs < min))`.g
backprop_wrt_maxQBackpropagated gradients w.r.t. max parameter:
`sum(gradients * (inputs > max))`.*:Compute gradients for a FakeQuantWithMinMaxVars operation.
Ś
!FakeQuantWithMinMaxVarsPerChannel

inputs
min
max
outputs*MFake-quantize the 'inputs' tensor of type float and one of the shapes: `[d]`,2ŗ`[b, d]` `[b, h, w, d]` via per-channel floats `min` and `max` of shape `[d]`
to 'outputs' tensor of same shape as `inputs`.

[min; max] is the clamping range for the 'inputs' data in the corresponding
depth channel.  Op divides this range into 255 steps (total of 256 values), then
replaces each 'inputs' value with the closest of the quantized step values.

This operation has a gradient and thus allows for training `min` and `max` values.
µ
)FakeQuantWithMinMaxVarsPerChannelGradient
	gradientsuBackpropagated gradients above the FakeQuantWithMinMaxVars operation,
shape one of: `[d]`, `[b, d]`,  `[b, h, w, d]`.£
inputsValues passed as inputs to the FakeQuantWithMinMaxVars operation, shape
  same as `gradients`.
min, max: Quantization interval, floats of shape `[d]`.
min
max
backprops_wrt_inputqBackpropagated gradients w.r.t. inputs, shape same as
`inputs`:
  `gradients * (inputs >= min && inputs <= max)`.z
backprop_wrt_mindBackpropagated gradients w.r.t. min parameter, shape `[d]`:
`sum_per_d(gradients * (inputs < min))`.z
backprop_wrt_maxdBackpropagated gradients w.r.t. max parameter, shape `[d]`:
`sum_per_d(gradients * (inputs > max))`.*DCompute gradients for a FakeQuantWithMinMaxVarsPerChannel operation.
D
	FakeQueue
resource
handle*Deprecated. Do not use.
Õ
Fill9
dims/1-D. Represents the shape of the output tensor.|
valuep0-D (scalar). Value to fill the returned tensor.

@compatibility(numpy)
Equivalent to np.full
@end_compatibility"T
output"T"	
Ttype*,Creates a tensor filled with a scalar value.2ĶThis operation creates a tensor of shape `dims` and fills it with `value`.

For example:

```prettyprint
# Output tensor has shape [2, 3].
fill([2, 3], 9) ==> [[9, 9, 9]
                     [9, 9, 9]]
```
ź
FixedLengthRecordReader9
reader_handle#The handle to reference the Reader."
header_bytesint "
record_bytesint"
footer_bytesint "|
	containerstring "cIf non-empty, this reader is placed in the given container.
Otherwise, a default container is used."
shared_namestring "wIf non-empty, this reader is named in the given bucket
with this shared_name. Otherwise, the node name is used instead.*7A Reader that outputs fixed-length records from a file.
é
FixedLengthRecordReaderV26
reader_handle#The handle to reference the Reader."
header_bytesint "
record_bytesint"
footer_bytesint "|
	containerstring "cIf non-empty, this reader is placed in the given container.
Otherwise, a default container is used."
shared_namestring "wIf non-empty, this reader is named in the given bucket
with this shared_name. Otherwise, the node name is used instead.*7A Reader that outputs fixed-length records from a file.
¬
FixedUnigramCandidateSampler
true_classesA batch_size * num_true matrix, in which each row contains the
IDs of the num_true target_classes in the corresponding original label.	o
sampled_candidatesWA vector of length num_sampled, in which each element is
the ID of a sampled candidate.	Ģ
true_expected_count²A batch_size * num_true matrix, representing
the number of times each candidate is expected to occur in a batch
of sampled candidates. If unique=true, then this is a probability.ź
sampled_expected_countĶA vector of length num_sampled, for each sampled
candidate representing the number of times the candidate is expected
to occur in a batch of sampled candidates.  If unique=true, then this is a
probability."7
num_trueint""Number of true labels per context.(0"J
num_sampledint"2Number of candidates to randomly sample per batch.(0"Ė
uniquebool"ŗIf unique is true, we sample with rejection, so that all sampled
candidates in a batch are unique. This requires some approximation to
estimate the post-rejection sampling probabilities."X
	range_maxint"BThe sampler will sample integers from the interval [0, range_max).(0"ź

vocab_filestring "ĻEach valid line in this file (which should have a CSV-like format)
corresponds to a valid word ID. IDs are in sequential order, starting from
num_reserved_ids. The last entry in each line is expected to be a value
corresponding to the count or relative probability. Exactly one of vocab_file
and unigrams needs to be passed to this op."Ū

distortionfloat%  ?"¾The distortion is used to skew the unigram probability distribution.
Each weight is first raised to the distortion's power before adding to the
internal unigram distribution. As a result, distortion = 1.0 gives regular
unigram sampling (as defined by the vocab file), and distortion = 0.0 gives
a uniform distribution."ń
num_reserved_idsint "ÓOptionally some reserved IDs can be added in the range [0,
..., num_reserved_ids) by the users. One use case is that a special unknown
word token is used as ID 0. These IDs will have a sampling probability of 0."

num_shardsint"żA sampler can be used to sample from a subset of the original range
in order to speed up the whole computation through parallelism. This parameter
(together with 'shard') indicates the number of partitions that are being
used in the overall computation.(0" 
shardint "A sampler can be used to sample from a subset of the original range
in order to speed up the whole computation through parallelism. This parameter
(together with 'num_shards') indicates the particular partition number of a
sampler op, when partitioning is being used.("¬
unigramslist(float)
 "A list of unigram counts or probabilities, one per ID in sequential
order. Exactly one of vocab_file and unigrams should be passed to this op."„
seedint "If either seed or seed2 are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."9
seed2int "'An second seed to avoid seed collision.*LGenerates labels for candidate sampling with a learned unigram distribution.2·A unigram sampler could use a fixed unigram distribution read from a
file or passed in as an in-memory array instead of building up the distribution
from data on the fly. There is also an option to skew the distribution by
applying a distortion power to the weights.

The vocabulary file should be in CSV-like format, with the last field
being the weight associated with the word.

For each batch, this op picks a single set of sampled candidate labels.

The advantages of sampling candidates per-batch are simplicity and the
possibility of efficient dense matrix multiplication. The disadvantage is that
the sampled candidates must be chosen independently of the context and of the
true labels.
e
Floor
x"T
y"T"
Ttype:
2*8Returns element-wise largest integer not greater than x.
ę
FloorDiv
x"T
y"T
z"T"
Ttype:
2	*Returns x // y element-wise.2*NOTE*: `FloorDiv` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)

FloorMod
x"T
y"T
z"T"
Ttype:
2	*GReturns element-wise remainder of division. When `x < 0` xor `y < 0` is2true, this follows Python semantics in that the result here is consistent
with a flooring divide. E.g. `floor(x / y) * y + mod(x, y) = x`.

*NOTE*: `FloorMod` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)
®
FractionalAvgPool>
value24-D with shape `[batch, height, width, channels]`."T8
output+output tensor after fractional avg pooling."TM
row_pooling_sequence3row pooling sequence, needed to calculate gradient.	P
col_pooling_sequence6column pooling sequence, needed to calculate gradient.	"
pooling_ratiolist(float)"ģPooling ratio for each dimension of `value`, currently only
supports row and col dimension and should be >= 1.0. For example, a valid
pooling ratio looks like [1.0, 1.44, 1.73, 1.0]. The first and last elements
must be 1.0 because we don't allow pooling on batch and channels
dimensions. 1.44 and 1.73 are pooling ratio on height and width dimensions
respectively.(0"
pseudo_randombool( "ńWhen set to True, generates the pooling sequence in a
pseudorandom fashion, otherwise, in a random fashion. Check paper [Benjamin
Graham, Fractional Max-Pooling](http://arxiv.org/abs/1412.6071) for
difference between pseudorandom and random."Ų
overlappingbool( "¾When set to True, it means when pooling, the values at the boundary
of adjacent pooling cells are used by both cells. For example:

`index  0  1  2  3  4`

`value  20 5  16 3  7`

If the pooling sequence is [0, 2, 4], then 16, at index 2 will be used twice.
The result would be [41/3, 26/3] for fractional avg pooling."Ś
deterministicbool( "¾When set to True, a fixed pooling region will be used when
iterating over a FractionalAvgPool node in the computation graph. Mainly used
in unit test to make FractionalAvgPool deterministic."„
seedint "If either seed or seed2 are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."9
seed2int "'An second seed to avoid seed collision."
Ttype:
2	*1Performs fractional average pooling on the input.2ųFractional average pooling is similar to Fractional max pooling in the pooling
region generation step. The only difference is that after pooling regions are
generated, a mean operation is performed instead of a max operation in each
pooling region.
Ź	
FractionalAvgPoolGradR
orig_input_tensor_shape5Original input tensor shape for `fractional_avg_pool`	|
out_backpropi4-D with shape `[batch, height, width, channels]`.  Gradients
w.r.t. the output of `fractional_avg_pool`."T^
row_pooling_sequenceDrow pooling sequence, form pooling region with
col_pooling_sequence.	a
col_pooling_sequenceGcolumn pooling sequence, form pooling region with
row_pooling sequence.	G
output:4-D.  Gradients w.r.t. the input of `fractional_avg_pool`."T"Ų
overlappingbool( "¾When set to True, it means when pooling, the values at the boundary
of adjacent pooling cells are used by both cells. For example:

`index  0  1  2  3  4`

`value  20 5  16 3  7`

If the pooling sequence is [0, 2, 4], then 16, at index 2 will be used twice.
The result would be [41/3, 26/3] for fractional avg pooling."
Ttype:
2	*4Computes gradient of the FractionalAvgPool function.2¬Unlike FractionalMaxPoolGrad, we don't need to find arg_max for
FractionalAvgPoolGrad, we just need to evenly back-propagate each element of
out_backprop to those indices that form the same pooling cell. Therefore, we
just need to know the shape of original input tensor, instead of the whole
tensor.

FractionalMaxPool>
value24-D with shape `[batch, height, width, channels]`."T8
output+output tensor after fractional max pooling."TM
row_pooling_sequence3row pooling sequence, needed to calculate gradient.	P
col_pooling_sequence6column pooling sequence, needed to calculate gradient.	"
pooling_ratiolist(float)"ģPooling ratio for each dimension of `value`, currently only
supports row and col dimension and should be >= 1.0. For example, a valid
pooling ratio looks like [1.0, 1.44, 1.73, 1.0]. The first and last elements
must be 1.0 because we don't allow pooling on batch and channels
dimensions. 1.44 and 1.73 are pooling ratio on height and width dimensions
respectively.(0"
pseudo_randombool( "ńWhen set to True, generates the pooling sequence in a
pseudorandom fashion, otherwise, in a random fashion. Check paper [Benjamin
Graham, Fractional Max-Pooling](http://arxiv.org/abs/1412.6071) for
difference between pseudorandom and random."Ō
overlappingbool( "ŗWhen set to True, it means when pooling, the values at the boundary
of adjacent pooling cells are used by both cells. For example:

`index  0  1  2  3  4`

`value  20 5  16 3  7`

If the pooling sequence is [0, 2, 4], then 16, at index 2 will be used twice.
The result would be [20, 16] for fractional max pooling."Ś
deterministicbool( "¾When set to True, a fixed pooling region will be used when
iterating over a FractionalMaxPool node in the computation graph. Mainly used
in unit test to make FractionalMaxPool deterministic."„
seedint "If either seed or seed2 are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."9
seed2int "'An second seed to avoid seed collision."
Ttype:
2	*-Performs fractional max pooling on the input.2Ó
Fractional max pooling is slightly different than regular max pooling.  In
regular max pooling, you downsize an input set by taking the maximum value of
smaller N x N subsections of the set (often 2x2), and try to reduce the set by
a factor of N, where N is an integer.  Fractional max pooling, as you might
expect from the word "fractional", means that the overall reduction ratio N
does not have to be an integer.

The sizes of the pooling regions are generated randomly but are fairly uniform.
For example, let's look at the height dimension, and the constraints on the
list of rows that will be pool boundaries.

First we define the following:

1.  input_row_length : the number of rows from the input set
2.  output_row_length : which will be smaller than the input
3.  alpha = input_row_length / output_row_length : our reduction ratio
4.  K = floor(alpha)
5.  row_pooling_sequence : this is the result list of pool boundary rows

Then, row_pooling_sequence should satisfy:

1.  a[0] = 0 : the first value of the sequence is 0
2.  a[end] = input_row_length : the last value of the sequence is the size
3.  K <= (a[i+1] - a[i]) <= K+1 : all intervals are K or K+1 size
4.  length(row_pooling_sequence) = output_row_length+1

For more details on fractional max pooling, see this paper:
[Benjamin Graham, Fractional Max-Pooling](http://arxiv.org/abs/1412.6071)
»
FractionalMaxPoolGrad9

orig_input(Original input for `fractional_max_pool`"T;
orig_output)Original output for `fractional_max_pool`"T|
out_backpropi4-D with shape `[batch, height, width, channels]`.  Gradients
w.r.t. the output of `fractional_max_pool`."T^
row_pooling_sequenceDrow pooling sequence, form pooling region with
col_pooling_sequence.	a
col_pooling_sequenceGcolumn pooling sequence, form pooling region with
row_pooling sequence.	G
output:4-D.  Gradients w.r.t. the input of `fractional_max_pool`."T"Ō
overlappingbool( "ŗWhen set to True, it means when pooling, the values at the boundary
of adjacent pooling cells are used by both cells. For example:

`index  0  1  2  3  4`

`value  20 5  16 3  7`

If the pooling sequence is [0, 2, 4], then 16, at index 2 will be used twice.
The result would be [20, 16] for fractional max pooling."
Ttype:
2	*4Computes gradient of the FractionalMaxPool function.
±
FusedBatchNorm#
xA 4D Tensor for input data."TF
scale:A 1D Tensor for scaling factor, to scale the normalized x."TB
offset5A 1D Tensor for offset, to shift to the normalized x."T`
meanUA 1D Tensor for population mean. Used for inference only;
must be empty for training."Th
varianceYA 1D Tensor for population variance. Used for inference only;
must be empty for training."T$
yA 4D Tensor for output data."To

batch_mean^A 1D Tensor for the computed batch mean, to be used by TensorFlow
to compute the running mean."T{
batch_variancefA 1D Tensor for the computed batch variance, to be used by
TensorFlow to compute the running variance."Th
reserve_space_1RA 1D Tensor for the computed batch mean, to be reused
in the gradient computation."T
reserve_space_2zA 1D Tensor for the computed batch variance (inverted variance
in the cuDNN case), to be used in the gradient computation."T"Z
Ttype";The data type for the elements of input and output Tensors.:
2	"I
epsilonfloat%·Ń8"0A small float number added to the variance of x."^
data_formatstringNHWC"?The data format for x and y. Either "NHWC" (default) or "NCHW"."g
is_trainingbool("NA bool value to indicate the operation is for training (default)
or inference.*Batch normalization.2Note that the size of 4D Tensors are defined by either "NHWC" or "NCHW".
The size of 1D Tensors matches the dimension C of the 4D Tensors.
ų

FusedBatchNormGrad@

y_backprop/A 4D Tensor for the gradient with respect to y."T#
xA 4D Tensor for input data."TF
scale:A 1D Tensor for scaling factor, to scale the normalized x."Th
reserve_space_1RA 1D Tensor for the computed batch mean, to be reused
in the gradient computation."T
reserve_space_2zA 1D Tensor for the computed batch variance (inverted variance
in the cuDNN case), to be used in the gradient computation."T@

x_backprop/A 4D Tensor for the gradient with respect to x."TH
scale_backprop3A 1D Tensor for the gradient with respect to scale."TJ
offset_backprop4A 1D Tensor for the gradient with respect to offset."TS
reserve_space_3=Unused placeholder to match the mean input in FusedBatchNorm."TW
reserve_space_4AUnused placeholder to match the variance input
in FusedBatchNorm."T"Z
Ttype";The data type for the elements of input and output Tensors.:
2	"I
epsilonfloat%·Ń8"0A small float number added to the variance of x."p
data_formatstringNHWC"QThe data format for y_backprop, x, x_backprop.
Either "NHWC" (default) or "NCHW"."g
is_trainingbool("NA bool value to indicate the operation is for training (default)
or inference.*!Gradient for batch normalization.2Note that the size of 4D Tensors are defined by either "NHWC" or "NCHW".
The size of 1D Tensors matches the dimension C of the 4D Tensors.

FusedPadConv2DG
input;4-D with shape `[batch, in_height, in_width, in_channels]`."T{
paddingsmA two-column matrix specifying the padding sizes. The number of
rows must be the same as the rank of `input`.W
filterJ4-D with shape
`[filter_height, filter_width, in_channels, out_channels]`."T
output"T"
Ttype:
2"&
modestring:
REFLECT	SYMMETRIC"Ŗ
strides	list(int)"1-D of length 4.  The stride of the sliding window for each dimension
of `input`. Must be in the same order as the dimension specified with format."I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*8Performs a padding as a preprocess during a convolution.2šSimilar to FusedResizeAndPadConv2d, this op allows for an optimized
implementation where the spatial padding transformation stage is fused with the
im2col lookup, but in this case without the bilinear filtering required for
resizing. Fusing the padding prevents the need to write out the intermediate
results as whole tensors, reducing memory pressure, and we can get some latency
gains by merging the transformation calculations.
The data_format attribute for Conv2D isn't supported by this op, and 'NHWC'
order is used instead.
Internally this op uses a single per-graph scratch buffer, which means that it
will block if multiple versions are being run in parallel. This is because this
operator is primarily an optimization to minimize memory usage.
Ō
FusedResizeAndPadConv2DG
input;4-D with shape `[batch, in_height, in_width, in_channels]`."Tb
sizeXA 1-D int32 Tensor of 2 elements: `new_height, new_width`.  The
new size for the images.{
paddingsmA two-column matrix specifying the padding sizes. The number of
rows must be the same as the rank of `input`.W
filterJ4-D with shape
`[filter_height, filter_width, in_channels, out_channels]`."T
output"T"
Ttype:
2"ķ
resize_align_cornersbool( "ŹIf true, rescale input by (new_height - 1) / (height - 1),
which exactly aligns the 4 corners of images and resized images. If false, rescale
by new_height / height. Treat similarly the width dimension."&
modestring:
REFLECT	SYMMETRIC"Ŗ
strides	list(int)"1-D of length 4.  The stride of the sliding window for each dimension
of `input`. Must be in the same order as the dimension specified with format."I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*CPerforms a resize and padding as a preprocess during a convolution.2æIt's often possible to do spatial transformations more efficiently as part of
the packing stage of a convolution, so this op allows for an optimized
implementation where these stages are fused together. This prevents the need to
write out the intermediate results as whole tensors, reducing memory pressure,
and we can get some latency gains by merging the transformation calculations.
The data_format attribute for Conv2D isn't supported by this op, and defaults to
'NHWC' order.
Internally this op uses a single per-graph scratch buffer, which means that it
will block if multiple versions are being run in parallel. This is because this
operator is primarily an optimization to minimize memory usage.
ī
Gather
params"Tparams
indices"Tindices
output"Tparams"
validate_indicesbool("
Tparamstype"
Tindicestype:
2	*3Gather slices from `params` according to `indices`.2Ŗ`indices` must be an integer tensor of any dimension (usually 0-D or 1-D).
Produces an output tensor with shape `indices.shape + params.shape[1:]` where:

```python
    # Scalar indices
    output[:, ..., :] = params[indices, :, ... :]

    # Vector indices
    output[i, :, ..., :] = params[indices[i], :, ... :]

    # Higher rank indices
    output[i, ..., j, :, ... :] = params[indices[i, ..., j], :, ..., :]
```

If `indices` is a permutation and `len(indices) == params.shape[0]` then
this operation will permute `params` accordingly.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/Gather.png" alt>
</div>
ä
GatherNdB
params/`P-D`.  The tensor from which to gather values."TparamsP
indices;`Q-D`.  Index tensor having shape `[d_0, ..., d_{Q-2}, K]`."Tindicesa
outputN`(P+Q-K-1)-D`.  Values from `params` gathered from indices given by
`indices`."Tparams"
Tparamstype"
Tindicestype:
2	*=Gather values or slices from `params` according to `indices`.2ō`params` is a Tensor of rank `P` and `indices` is a Tensor of rank `Q`.

`indices` must be integer tensor, containing indices into `params`.
It must be shape `[d_0, ..., d_{Q-2}, K]` where `0 < K <= P`.

The innermost dimension of `indices` (with length `K`) corresponds to
indices into elements (if `K = P`) or slices (if `K < P`) along the `K`th
dimension of `params`.

Produces an output tensor with shape

```
[d_0, ..., d_{Q-2}, params.shape[K], ..., params.shape[P-1]].
```

Some examples below.

Simple indexing into a matrix:

```python
    indices = [[0, 0], [1, 1]]
    params = [['a', 'b'], ['c', 'd']]
    output = ['a', 'd']
```

Slice indexing into a matrix:

```python
    indices = [[1], [0]]
    params = [['a', 'b'], ['c', 'd']]
    output = [['c', 'd'], ['a', 'b']]
```

Indexing into a 3-tensor:

```python
    indices = [[1]]
    params = [[['a0', 'b0'], ['c0', 'd0']],
              [['a1', 'b1'], ['c1', 'd1']]]
    output = [[['a1', 'b1'], ['c1', 'd1']]]


    indices = [[0, 1], [1, 0]]
    params = [[['a0', 'b0'], ['c0', 'd0']],
              [['a1', 'b1'], ['c1', 'd1']]]
    output = [['c0', 'd0'], ['a1', 'b1']]


    indices = [[0, 0, 1], [1, 0, 1]]
    params = [[['a0', 'b0'], ['c0', 'd0']],
              [['a1', 'b1'], ['c1', 'd1']]]
    output = ['b0', 'b1']
```

Batched indexing into a matrix:

```python
    indices = [[[0, 0]], [[0, 1]]]
    params = [['a', 'b'], ['c', 'd']]
    output = [['a'], ['b']]
```

Batched slice indexing into a matrix:

```python
    indices = [[[1]], [[0]]]
    params = [['a', 'b'], ['c', 'd']]
    output = [[['c', 'd']], [['a', 'b']]]
```

Batched indexing into a 3-tensor:

```python
    indices = [[[1]], [[0]]]
    params = [[['a0', 'b0'], ['c0', 'd0']],
              [['a1', 'b1'], ['c1', 'd1']]]
    output = [[[['a1', 'b1'], ['c1', 'd1']]],
              [[['a0', 'b0'], ['c0', 'd0']]]]

    indices = [[[0, 1], [1, 0]], [[0, 0], [1, 1]]]
    params = [[['a0', 'b0'], ['c0', 'd0']],
              [['a1', 'b1'], ['c1', 'd1']]]
    output = [[['c0', 'd0'], ['a1', 'b1']],
              [['a0', 'b0'], ['c1', 'd1']]]


    indices = [[[0, 0, 1], [1, 0, 1]], [[0, 1, 1], [1, 1, 0]]]
    params = [[['a0', 'b0'], ['c0', 'd0']],
              [['a1', 'b1'], ['c1', 'd1']]]
    output = [['b0', 'b1'], ['d0', 'c1']]
```
Ä
GetSessionHandle$
valueThe tensor to be stored."TB
handle6The handle for the tensor stored in the session state."	
Ttype*;Store the input tensor in the state of the current session.
ź
GetSessionTensor@
handle4The handle for a tensor stored in the session state.0
value The tensor for the given handle."dtype",
dtypetype"The type of the output value.*4Get the value of the tensor specified by its handle.
õ
Greater
x"T
y"T
z
"
Ttype:
2		*0Returns the truth value of (x > y) element-wise.2*NOTE*: `Greater` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)

GreaterEqual
x"T
y"T
z
"
Ttype:
2		*1Returns the truth value of (x >= y) element-wise.2*NOTE*: `GreaterEqual` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)
“
HSVToRGBT
imagesG1-D or higher rank. HSV data to convert. Last dimension must be size 3."T'
output`images` converted to RGB."T"
Ttype0:
2*+Convert one or more images from HSV to RGB.2äOutputs a tensor of the same shape as the `images` tensor, containing the RGB
value of the pixels. The output is only well defined if the value in `images`
are in `[0,1]`.

See `rgb_to_hsv` for a description of the HSV encoding.
Ź
	HashTable'
table_handleHandle to a table."{
	containerstring "bIf non-empty, this table is placed in the given container.
Otherwise, a default container is used."l
shared_namestring "QIf non-empty, this table is shared under the given name across
multiple sessions."m
use_node_name_sharingbool( "JIf true and shared_name is empty, the table is shared
using the node name."*
	key_dtypetype"Type of the table keys.".
value_dtypetype"Type of the table values.*%Creates a non-initialized hash table.2³This op creates a hash table, specifying the type of its keys and values.
Before using the table you will have to initialize it.  After initialization the
table will be immutable.

HistogramSummary5
tag,Scalar.  Tag to use for the `Summary.Value`.=
values0Any shape. Values to use to build the histogram."T:
summary-Scalar. Serialized `Summary` protocol buffer."
Ttype0:
2		*5Outputs a `Summary` protocol buffer with a histogram.2åThe generated
[`Summary`](https://www.tensorflow.org/code/tensorflow/core/framework/summary.proto)
has one summary value containing a histogram for `values`.

This op reports an `InvalidArgument` error if any value is not finite.
¦
IFFT
inputA complex64 tensor.
outputA complex64 tensor of the same shape as `input`. The inner-most
dimension of `input` is replaced with its inverse 1D Fourier Transform.*PCompute the inverse 1-dimensional discrete Fourier Transform over the inner-most2dimension of `input`.
ō
IFFT2D
inputA complex64 tensor.Ż
outputŠA complex64 tensor of the same shape as `input`. The inner-most 2
  dimensions of `input` are replaced with their inverse 2D Fourier Transform.

@compatibility(numpy)
Equivalent to np.ifft2
@end_compatibility*PCompute the inverse 2-dimensional discrete Fourier Transform over the inner-most22 dimensions of `input`.
ó
IFFT3D
inputA complex64 tensor.Ü
outputĻA complex64 tensor of the same shape as `input`. The inner-most 3
  dimensions of `input` are replaced with their inverse 3D Fourier Transform.

@compatibility(numpy)
Equivalent to np.fft3
@end_compatibility*PCompute the inverse 3-dimensional discrete Fourier Transform over the inner-most23 dimensions of `input`.
~
Identity

input"T
output"T"	
Ttype*NReturn a tensor with the same shape and contents as the input tensor or value.

IdentityReader9
reader_handle#The handle to reference the Reader."|
	containerstring "cIf non-empty, this reader is placed in the given container.
Otherwise, a default container is used."
shared_namestring "wIf non-empty, this reader is named in the given bucket
with this shared_name. Otherwise, the node name is used instead.*@A Reader that outputs the queued work as both the key and value.2hTo use, enqueue strings in a Queue.  ReaderRead will take the front
work string and output (work, work).

IdentityReaderV26
reader_handle#The handle to reference the Reader."|
	containerstring "cIf non-empty, this reader is placed in the given container.
Otherwise, a default container is used."
shared_namestring "wIf non-empty, this reader is named in the given bucket
with this shared_name. Otherwise, the node name is used instead.*@A Reader that outputs the queued work as both the key and value.2hTo use, enqueue strings in a Queue.  ReaderRead will take the front
work string and output (work, work).
Ø
Igamma
a"T
x"T
z"T"
Ttype:
2*BCompute the lower regularized incomplete Gamma function `Q(a, x)`.2®The lower regularized incomplete Gamma function is defined as:

```
P(a, x) = gamma(a, x) / Gamma(a) = 1 - Q(a, x)
```
where
```
gamma(a, x) = int_{0}^{x} t^{a-1} exp(-t) dt
```
is the lower incomplete Gamma function.

Note, above `Q(a, x)` (`Igammac`) is the upper regularized complete
Gamma function.
¬
Igammac
a"T
x"T
z"T"
Ttype:
2*BCompute the upper regularized incomplete Gamma function `Q(a, x)`.2±The upper regularized incomplete Gamma function is defined as:

```
Q(a, x) = Gamma(a, x) / Gamma(a) = 1 - P(a, x)
```
where
```
Gamma(a, x) = int_{x}^{\infty} t^{a-1} exp(-t) dt
```
is the upper incomplete Gama function.

Note, above `P(a, x)` (`Igamma`) is the lower regularized complete
Gamma function.
 
Imag

input"T
output"Tout"
Ttype0:
2"
Touttype0:
2*/Returns the imaginary part of a complex number.2Given a tensor `input` of complex numbers, this operation returns a tensor of
type `float` that is the imaginary part of each element in `input`. All
elements in `input` must be complex numbers of the form \\(a + bj\\), where *a*
is the real part and *b* is the imaginary part returned by this operation.

For example:

```
# tensor 'input' is [-2.25 + 4.75j, 3.25 + 5.75j]
tf.imag(input) ==> [4.75, 5.75]
```
ķ
ImageSummaryI
tag@Scalar. Used to build the `tag` attribute of the summary values.a
tensorT4-D of shape `[batch_size, height, width, channels]` where
`channels` is 1, 3, or 4."T:
summary-Scalar. Serialized `Summary` protocol buffer."O

max_imagesint"4Max number of batch elements to generate images for.(0"
Ttype0:
2"X
	bad_colortensorB:’  ’"/Color to use for pixels with non-finite values.*0Outputs a `Summary` protocol buffer with images.2żThe summary has up to `max_images` summary values containing images. The
images are built from `tensor` which must be 4-D with shape `[batch_size,
height, width, channels]` and where `channels` can be:

*  1: `tensor` is interpreted as Grayscale.
*  3: `tensor` is interpreted as RGB.
*  4: `tensor` is interpreted as RGBA.

The images have the same number of channels as the input tensor. For float
input, the values are normalized one image at a time to fit in the range
`[0, 255]`.  `uint8` values are unchanged.  The op uses two different
normalization algorithms:

*  If the input values are all positive, they are rescaled so the largest one
   is 255.

*  If any input value is negative, the values are shifted so input value 0.0
   is at 127.  They are then rescaled so that either the smallest value is 0,
   or the largest one is 255.

The `tag` argument is a scalar `Tensor` of type `string`.  It is used to
build the `tag` of the summary values:

*  If `max_images` is 1, the summary value tag is '*tag*/image'.
*  If `max_images` is greater than 1, the summary value tags are
   generated sequentially as '*tag*/image/0', '*tag*/image/1', etc.

The `bad_color` argument is the color to use in the generated images for
non-finite input values.  It is a `unit8` 1-D tensor of length `channels`.
Each element must be in the range `[0, 255]` (It represents the value of a
pixel in the output image).  Non-finite values in the input tensor are
replaced by this tensor in the output image.  The default value is the color
red.
ņ
ImmutableConst
tensor"dtype"+
dtypetype"Type of the returned tensor."-
shapeshape"Shape of the returned tensor."
memory_region_namestring"jName of readonly memory region used by the tensor, see
NewReadOnlyMemoryRegionFromFile in tensorflow::Env.*,Returns immutable tensor from memory region.2:The current implementation memmaps the tensor from a file.
ń
InTopK3
predictions"A `batch_size` x `classes` tensor.1
targets#A `batch_size` vector of class ids."T<
	precision-Computed Precision at `k` as a `bool Tensor`.
"D
kint":Number of top elements to look at for computing precision."
Ttype0:
2	*8Says whether the targets are in the top `K` predictions.2©This outputs a `batch_size` bool array, an entry `out[i]` is `true` if the
prediction for the target class is among the top `k` predictions among
all predictions for example `i`. Note that the behavior of `InTopK` differs
from the `TopK` op in its handling of ties; if multiple classes have the
same prediction value and straddle the top-`k` boundary, all of those
classes are considered to be in the top `k`.

More formally, let

  \\(predictions_i\\) be the predictions for all classes for example `i`,
  \\(targets_i\\) be the target class for example `i`,
  \\(out_i\\) be the output for example `i`,

$$out_i = predictions_{i, targets_i} \in TopKIncludingTies(predictions_i)$$

InitializeTableA
table_handle,Handle to a table which will be initialized. 
keysKeys of type Tkey."Tkey$
valuesValues of type Tval."Tval"
Tkeytype"
Tvaltype*JTable initializer that takes two tensors for keys and values respectively.
č
InitializeTableFromTextFileA
table_handle,Handle to a table which will be initialized.1
filename#Filename of a vocabulary text file."Y
	key_indexint":Column index in a line to get the table `key` values from.(0ž’’’’’’’’"y
value_indexint"XColumn index that represents information of a line to get the table
`value` values from.(0ž’’’’’’’’"_

vocab_sizeint’’’’’’’’’"2Number of elements of the file, use -1 if unknown.(0’’’’’’’’’"A
	delimiterstring	"'Delimiter to separate fields in a line.*%Initializes a table from a text file.2±It inserts one key-value pair into the table for each line of the file.
The key and value is extracted from the whole line content, elements from the
split line based on `delimiter` or the line number (starting from zero).
Where to extract the key and value from a line is specified by `key_index` and
`value_index`.

- A value of -1 means use the line number(starting from zero), expects `int64`.
- A value of -2 means use the whole line content, expects `string`.
- A value >= 0 means use the index (starting at zero) of the split line based
  on `delimiter`.

Inv
x"T
y"T"
Ttype:
	2	**Computes the reciprocal of x element-wise.2I.e., \\(y = 1 / x\\).BUse Reciprocal
ī
InvGrad
x"T
y"T
z"T"
Ttype:	
2*;Computes the gradient for the inverse of `x` wrt its input.2`Specifically, `grad = -dy * y*y`, where `y = 1/x`, and `dy`
is the corresponding input gradient.BUse ReciprocalGrad

InvertPermutation
x1-D."T
y1-D."T"
Ttype0:
2	*-Computes the inverse permutation of a tensor.2This operation computes the inverse of an index permutation. It takes a 1-D
integer tensor `x`, which represents the indices of a zero-based array, and
swaps each value with its index position. In other words, for an output tensor
`y` and an input tensor `x`, this operation computes the following:

`y[x[i]] = i for i in [0, 1, ..., len(x) - 1]`

The values must include 0. There can be no duplicate values or negative values.

For example:

```prettyprint
# tensor `x` is [3, 4, 0, 2, 1]
invert_permutation(x) ==> [2, 4, 3, 0, 1]
```

IsFinite
x"T
y
"
Ttype:
2*'Returns which elements of x are finite.2B@compatibility(numpy)
Equivalent to np.isfinite
@end_compatibility

IsInf
x"T
y
"
Ttype:
2*$Returns which elements of x are Inf.2?@compatibility(numpy)
Equivalent to np.isinf
@end_compatibility

IsNan
x"T
y
"
Ttype:
2*$Returns which elements of x are NaN.2?@compatibility(numpy)
Equivalent to np.isnan
@end_compatibility
°
IsVariableInitializedH
ref7Should be from a `Variable` node. May be uninitialized."dtype
is_initialized
";
dtypetype",The type of elements in the variable tensor.*-Checks whether a tensor has been initialized.2JOutputs boolean scalar indicating whether the tensor has been initialized.
Ņ
L2Loss3
t+Typically 2-D, but may have any dimensions."T
output0-D."T"
Ttype:
2	*L2 Loss.2WComputes half the L2 norm of a tensor without the `sqrt`:

    output = sum(t ** 2) / 2
Č
LRN
input4-D."T
output"T"J
depth_radiusint"10-D.  Half-width of the 1-D normalization window."J
biasfloat%  ?"4An offset (usually positive to avoid dividing by 0)."8
alphafloat%  ?"!A scale factor, usually positive.""
betafloat%   ?"An exponent."
Ttype0:
2*Local Response Normalization.2õThe 4-D `input` tensor is treated as a 3-D array of 1-D vectors (along the last
dimension), and each vector is normalized independently.  Within a given vector,
each component is divided by the weighted, squared sum of inputs within
`depth_radius`.  In detail,

    sqr_sum[a, b, c, d] =
        sum(input[a, b, c, d - depth_radius : d + depth_radius + 1] ** 2)
    output = input / (bias + alpha * sqr_sum) ** beta

For details, see [Krizhevsky et al., ImageNet classification with deep
convolutional neural networks (NIPS 2012)](http://papers.nips.cc/paper/4824-imagenet-classification-with-deep-convolutional-neural-networks).

LRNGradD
input_grads24-D with shape `[batch, height, width, channels]`."TD
input_image24-D with shape `[batch, height, width, channels]`."TE
output_image24-D with shape `[batch, height, width, channels]`."T#
outputThe gradients for LRN."T"(
depth_radiusint"A depth radius."E
biasfloat%  ?"/An offset (usually > 0 to avoid dividing by 0)."8
alphafloat%  ?"!A scale factor, usually positive.""
betafloat%   ?"An exponent."
Ttype0:
2*+Gradients for Local Response Normalization.
Ś
LearnedUnigramCandidateSampler
true_classesA batch_size * num_true matrix, in which each row contains the
IDs of the num_true target_classes in the corresponding original label.	o
sampled_candidatesWA vector of length num_sampled, in which each element is
the ID of a sampled candidate.	Ģ
true_expected_count²A batch_size * num_true matrix, representing
the number of times each candidate is expected to occur in a batch
of sampled candidates. If unique=true, then this is a probability.ź
sampled_expected_countĶA vector of length num_sampled, for each sampled
candidate representing the number of times the candidate is expected
to occur in a batch of sampled candidates.  If unique=true, then this is a
probability."7
num_trueint""Number of true labels per context.(0"J
num_sampledint"2Number of candidates to randomly sample per batch.(0"Ė
uniquebool"ŗIf unique is true, we sample with rejection, so that all sampled
candidates in a batch are unique. This requires some approximation to
estimate the post-rejection sampling probabilities."X
	range_maxint"BThe sampler will sample integers from the interval [0, range_max).(0"„
seedint "If either seed or seed2 are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."9
seed2int "'An second seed to avoid seed collision.*LGenerates labels for candidate sampling with a learned unigram distribution.2See explanations of candidate sampling and the data formats at
go/candidate-sampling.

For each batch, this op picks a single set of sampled candidate labels.

The advantages of sampling candidates per-batch are simplicity and the
possibility of efficient dense matrix multiplication. The disadvantage is that
the sampled candidates must be chosen independently of the context and of the
true labels.
ļ
Less
x"T
y"T
z
"
Ttype:
2		*0Returns the truth value of (x < y) element-wise.2*NOTE*: `Less` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)
ś
	LessEqual
x"T
y"T
z
"
Ttype:
2		*1Returns the truth value of (x <= y) element-wise.2*NOTE*: `LessEqual` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)
p
Lgamma
x"T
y"T"
Ttype:
2*BComputes the log of the absolute value of `Gamma(x)` element-wise.

LinSpace%
startFirst entry in the range."T#
stopLast entry in the range."T*
numNumber of values to generate."Tidx'
output1-D. The generated values."T"
Ttype:
2"
Tidxtype0:
2	* Generates values in an interval.2A sequence of `num` evenly-spaced values are generated beginning at `start`.
If `num > 1`, the values in the sequence increase by `stop - start / num - 1`,
so that the last one is exactly `stop`.

For example:

```
tf.linspace(10.0, 12.0, 3, name="linspace") => [ 10.0  11.0  12.0]
```
÷
ListDiff
x1-D. Values to keep."T
y1-D. Values to remove."T4
out*1-D. Values present in `x` but not in `y`."T@
idx01-D. Positions of `x` values preserved in `out`."out_idx"	
Ttype"
out_idxtype0:
2	*@Computes the difference between two lists of numbers or strings.2ŹGiven a list `x` and a list `y`, this operation returns a list `out` that
represents all values that are in `x` but not in `y`. The returned list `out`
is sorted in the same order that the numbers appear in `x` (duplicates are
preserved). This operation also returns a list `idx` that represents the
position of each `out` element in `x`. In other words:

`out[i] = x[idx[i]] for i in [0, 1, ..., len(out) - 1]`

For example, given this input:

```prettyprint
x = [1, 2, 3, 4, 5, 6]
y = [1, 3, 5]
```

This operation would return:

```prettyprint
out ==> [2, 4, 6]
idx ==> [1, 3, 5]
```
u
Log
x"T
y"T"
Ttype:	
2*-Computes natural logarithm of x element-wise.2I.e., \\(y = \log_e x\\).

Log1p
x"T
y"T"
Ttype:	
2*3Computes natural logarithm of (1 + x) element-wise.2I.e., \\(y = \log_e (1 + x)\\).


LogSoftmax8
logits+2-D with shape `[batch_size, num_classes]`."T(

logsoftmaxSame shape as `logits`."T"
Ttype:
2*!Computes log softmax activations.2hFor each batch `i` and class `j` we have

    logsoftmax[i, j] = logits[i, j] - log(sum(exp(logits[i])))
Ņ
LogUniformCandidateSampler
true_classesA batch_size * num_true matrix, in which each row contains the
IDs of the num_true target_classes in the corresponding original label.	o
sampled_candidatesWA vector of length num_sampled, in which each element is
the ID of a sampled candidate.	Ģ
true_expected_count²A batch_size * num_true matrix, representing
the number of times each candidate is expected to occur in a batch
of sampled candidates. If unique=true, then this is a probability.ź
sampled_expected_countĶA vector of length num_sampled, for each sampled
candidate representing the number of times the candidate is expected
to occur in a batch of sampled candidates.  If unique=true, then this is a
probability."7
num_trueint""Number of true labels per context.(0"J
num_sampledint"2Number of candidates to randomly sample per batch.(0"Ė
uniquebool"ŗIf unique is true, we sample with rejection, so that all sampled
candidates in a batch are unique. This requires some approximation to
estimate the post-rejection sampling probabilities."X
	range_maxint"BThe sampler will sample integers from the interval [0, range_max).(0"„
seedint "If either seed or seed2 are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."9
seed2int "'An second seed to avoid seed collision.*HGenerates labels for candidate sampling with a log-uniform distribution.2See explanations of candidate sampling and the data formats at
go/candidate-sampling.

For each batch, this op picks a single set of sampled candidate labels.

The advantages of sampling candidates per-batch are simplicity and the
possibility of efficient dense matrix multiplication. The disadvantage is that
the sampled candidates must be chosen independently of the context and of the
true labels.
ā

LogicalAnd
x

y

z
*0Returns the truth value of x AND y element-wise.2*NOTE*: `LogicalAnd` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)
J

LogicalNot
x

y
*.Returns the truth value of NOT x element-wise.
ß
	LogicalOr
x

y

z
*/Returns the truth value of x OR y element-wise.2*NOTE*: `LogicalOr` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)

LookupTableExport)
table_handleHandle to the table.7
keys(Vector of all keys present in the table."TkeysV
valuesCTensor of all values in the table. Indexed in parallel with `keys`."Tvalues"
Tkeystype"
Tvaluestype*)Outputs all keys and values in the table.
Ä
LookupTableFind)
table_handleHandle to the table.)
keysAny shape.  Keys to look up."Tin
default_value"Toutg
valuesWSame shape as `keys`.  Values found in the table, or `default_values`
for missing keys."Tout"
Tintype"
Touttype*;Looks up keys in a table, outputs the corresponding values.2The tensor `keys` must of the same type as the keys of the table.
The output `values` is of the type of the table values.

The scalar `default_value` is the value output for keys not present in the
table. It must also be of the same type as the table values.

LookupTableImport)
table_handleHandle to the table.)
keysAny shape.  Keys to look up."Tin.
valuesValues to associate with keys."Tout"
Tintype"
Touttype*FReplaces the contents of the table with the specified keys and values.2The tensor `keys` must be of the same type as the keys of the table.
The tensor `values` must be of the type of the table values.
ė
LookupTableInsert)
table_handleHandle to the table.)
keysAny shape.  Keys to look up."Tin.
valuesValues to associate with keys."Tout"
Tintype"
Touttype*1Updates the table to associates keys with values.2The tensor `keys` must be of the same type as the keys of the table.
The tensor `values` must be of the type of the table values.
²
LookupTableSize)
table_handleHandle to the table.?
size5Scalar that contains number of elements in the table.	*3Computes the number of elements in the given table.

LoopCondP
inputEA boolean scalar, representing the branch predicate of the Switch op.
'
outputThe same tensor as `input`.
*!Forwards the input to the output.2_This operator represents the loop termination condition used by the
"pivot" switches of a loop.
”
MatMul
a"T
b"T
product"T"J
transpose_abool( "1If true, "a" is transposed before multiplication."J
transpose_bbool( "1If true, "b" is transposed before multiplication."
Ttype:

2**Multiply the matrix "a" by the matrix "b".2The inputs must be two-dimensional matrices and the inner dimension of
"a" (after being transposed if transpose_a is true) must match the
outer dimension of "b" (after being transposed if transposed_b is
true).

*Note*: The default kernel implementation for MatMul on GPUs uses
cublas.

MatchingFiles/
pattern"A (scalar) shell wildcard pattern..
	filenamesA vector of matching filenames.*,Returns the set of files matching a pattern.2~Note that this routine only supports wildcard characters in the
basename portion of the pattern, not in the directory portion.
Ž
MatrixBandPart
inputRank `k` tensor."Tc
	num_lowerT0-D tensor. Number of subdiagonals to keep. If negative, keep entire
lower triangle.	e
	num_upperV0-D tensor. Number of superdiagonals to keep. If negative, keep
entire upper triangle.	S
bandHRank `k` tensor of the same shape as input. The extracted banded tensor."T"	
Ttype*PCopy a tensor setting everything outside a central band in each innermost matrix2Æ	to zero.

The `band` part is computed as follows:
Assume `input` has `k` dimensions `[I, J, K, ..., M, N]`, then the output is a
tensor with the same shape where

`band[i, j, k, ..., m, n] = in_band(m, n) * input[i, j, k, ..., m, n]`.

The indicator function

`in_band(m, n) = (num_lower < 0 || (m-n) <= num_lower)) &&
                 (num_upper < 0 || (n-m) <= num_upper)`.

For example:

```prettyprint
# if 'input' is [[ 0,  1,  2, 3]
                 [-1,  0,  1, 2]
                 [-2, -1,  0, 1]
                 [-3, -2, -1, 0]],

tf.matrix_band_part(input, 1, -1) ==> [[ 0,  1,  2, 3]
                                       [-1,  0,  1, 2]
                                       [ 0, -1,  0, 1]
                                       [ 0,  0, -1, 0]],

tf.matrix_band_part(input, 2, 1) ==> [[ 0,  1,  0, 0]
                                      [-1,  0,  1, 0]
                                      [-2, -1,  0, 1]
                                      [ 0, -2, -1, 0]]
```

Useful special cases:

```prettyprint
 tf.matrix_band_part(input, 0, -1) ==> Upper triangular part.
 tf.matrix_band_part(input, -1, 0) ==> Lower triangular part.
 tf.matrix_band_part(input, 0, 0) ==> Diagonal.
```
å
MatrixDeterminant#
inputShape is `[..., M, M]`."T
outputShape is `[...]`."T"
Ttype:
2*9Computes the determinant of one ore more square matrices.2¼The input is a tensor of shape `[..., M, M]` whose inner-most 2 dimensions
form square matrices. The output is a tensor containing the determinants
for all input submatrices `[..., :, :]`.
ć

MatrixDiag(
diagonalRank `k`, where `k >= 1`."TU
outputHRank `k+1`, with `output.shape = diagonal.shape + [diagonal.shape[-1]]`."T"	
Ttype*GReturns a batched diagonal tensor with a given batched diagonal values.2’Given a `diagonal`, this operation returns a tensor with the `diagonal` and
everything else padded with zeros. The diagonal is computed as follows:

Assume `diagonal` has `k` dimensions `[I, J, K, ..., N]`, then the output is a
tensor of rank `k+1` with dimensions [I, J, K, ..., N, N]` where:

`output[i, j, k, ..., m, n] = 1{m=n} * diagonal[i, j, k, ..., n]`.

For example:

```prettyprint
# 'diagonal' is [[1, 2, 3, 4], [5, 6, 7, 8]]

and diagonal.shape = (2, 4)

tf.matrix_diag(diagonal) ==> [[[1, 0, 0, 0]
                                     [0, 2, 0, 0]
                                     [0, 0, 3, 0]
                                     [0, 0, 0, 4]],
                                    [[5, 0, 0, 0]
                                     [0, 6, 0, 0]
                                     [0, 0, 7, 0]
                                     [0, 0, 0, 8]]]

which has shape (2, 4, 4)
```
ē
MatrixDiagPart+
inputRank `k` tensor where `k >= 2`."Tt
diagonaleThe extracted diagonal(s) having shape
`diagonal.shape = input.shape[:-2] + [min(input.shape[-2:])]`."T"	
Ttype*6Returns the batched diagonal part of a batched tensor.2īThis operation returns a tensor with the `diagonal` part
of the batched `input`. The `diagonal` part is computed as follows:

Assume `input` has `k` dimensions `[I, J, K, ..., M, N]`, then the output is a
tensor of rank `k - 1` with dimensions `[I, J, K, ..., min(M, N)]` where:

`diagonal[i, j, k, ..., n] = input[i, j, k, ..., n, n]`.

The input must be at least a matrix.

For example:

```prettyprint
# 'input' is [[[1, 0, 0, 0]
               [0, 2, 0, 0]
               [0, 0, 3, 0]
               [0, 0, 0, 4]],
              [[5, 0, 0, 0]
               [0, 6, 0, 0]
               [0, 0, 7, 0]
               [0, 0, 0, 8]]]

and input.shape = (2, 4, 4)

tf.matrix_diag_part(input) ==> [[1, 2, 3, 4], [5, 6, 7, 8]]

which has shape (2, 4)
```
ż
MatrixInverse#
inputShape is `[..., M, M]`."Tj
output]Shape is `[..., M, M]`.

@compatibility(numpy)
Equivalent to np.linalg.inv
@end_compatibility"T"
adjointbool( "
Ttype:
2*GComputes the inverse of one or more square invertible matrices or their2éadjoints (conjugate transposes).

The input is a tensor of shape `[..., M, M]` whose inner-most 2 dimensions
form square matrices. The output is a tensor of the same shape as the input
containing the inverse for all input submatrices `[..., :, :]`.

The op uses LU decomposition with partial pivoting to compute the inverses.

If a matrix is not invertible there is no guarantee what the op does. It
may detect the condition and raise an exception or it may simply return a
garbage result.
×
MatrixSetDiag'
inputRank `k+1`, where `k >= 1`."T(
diagonalRank `k`, where `k >= 1`."T;
output.Rank `k+1`, with `output.shape = input.shape`."T"	
Ttype*AReturns a batched matrix tensor with new batched diagonal values.2ēGiven `input` and `diagonal`, this operation returns a tensor with the
same shape and values as `input`, except for the main diagonal of the
innermost matrices.  These will be overwritten by the values in `diagonal`.

The output is computed as follows:

Assume `input` has `k+1` dimensions `[I, J, K, ..., M, N]` and `diagonal` has
`k` dimensions `[I, J, K, ..., min(M, N)]`.  Then the output is a
tensor of rank `k+1` with dimensions `[I, J, K, ..., M, N]` where:

  * `output[i, j, k, ..., m, n] = diagonal[i, j, k, ..., n]` for `m == n`.
  * `output[i, j, k, ..., m, n] = input[i, j, k, ..., m, n]` for `m != n`.
Ę
MatrixSolve$
matrixShape is `[..., M, M]`."T!
rhsShape is `[..., M, K]`."T$
outputShape is `[..., M, K]`."T"c
adjointbool( "NBoolean indicating whether to solve with `matrix` or its (block-wise)
adjoint."
Ttype:
2*#Solves systems of linear equations.2Ø`Matrix` is a tensor of shape `[..., M, M]` whose inner-most 2 dimensions
form square matrices. `Rhs` is a tensor of shape `[..., M, K]`. The `output` is
a tensor shape `[..., M, K]`.  If `adjoint` is `False` then each output matrix
satisfies `matrix[..., :, :] * output[..., :, :] = rhs[..., :, :]`.
If `adjoint` is `True` then each output matrix satisfies
`adjoint(matrix[..., :, :]) * output[..., :, :] = rhs[..., :, :]`.
·
MatrixSolveLs$
matrixShape is `[..., M, N]`."T!
rhsShape is `[..., M, K]`."Tj
l2_regularizerVScalar tensor.

@compatibility(numpy)
Equivalent to np.linalg.lstsq
@end_compatibility$
outputShape is `[..., N, K]`."T"
Ttype:
2"
fastbool(*1Solves one or more linear least-squares problems.2ņ`matrix` is a tensor of shape `[..., M, N]` whose inner-most 2 dimensions
form matrices of size `[M, N]`. Rhs is a tensor of shape `[..., M, K]`.
The output is a tensor shape `[..., N, K]` where each output matrix solves
each of the equations matrix[..., :, :] * output[..., :, :] = rhs[..., :, :]
in the least squares sense.

matrix and right-hand sides in the batch:

`matrix`=\\(A \in \Re^{m \times n}\\),
`rhs`=\\(B  \in \Re^{m \times k}\\),
`output`=\\(X  \in \Re^{n \times k}\\),
`l2_regularizer`=\\(\lambda\\).

If `fast` is `True`, then the solution is computed by solving the normal
equations using Cholesky decomposition. Specifically, if \\(m \ge n\\) then
\\(X = (A^T A + \lambda I)^{-1} A^T B\\), which solves the least-squares
problem \\(X = \mathrm{argmin}_{Z \in \Re^{n \times k}} ||A Z - B||_F^2 +
\lambda ||Z||_F^2\\). If \\(m \lt n\\) then `output` is computed as
\\(X = A^T (A A^T + \lambda I)^{-1} B\\), which (for \\(\lambda = 0\\)) is the
minimum-norm solution to the under-determined linear system, i.e.
\\(X = \mathrm{argmin}_{Z \in \Re^{n \times k}} ||Z||_F^2 \\), subject to
\\(A Z = B\\). Notice that the fast path is only numerically stable when
\\(A\\) is numerically full rank and has a condition number
\\(\mathrm{cond}(A) \lt \frac{1}{\sqrt{\epsilon_{mach}}}\\) or\\(\lambda\\) is
sufficiently large.

If `fast` is `False` an algorithm based on the numerically robust complete
orthogonal decomposition is used. This computes the minimum-norm
least-squares solution, even when \\(A\\) is rank deficient. This path is
typically 6-7 times slower than the fast path. If `fast` is `False` then
`l2_regularizer` is ignored.
Ø

MatrixTriangularSolve$
matrixShape is `[..., M, M]`."T!
rhsShape is `[..., M, K]`."T$
outputShape is `[..., M, K]`."T"o
lowerbool("\Boolean indicating whether the innermost matrices in `matrix` are
lower or upper triangular."Ą
adjointbool( "ŖBoolean indicating whether to solve with `matrix` or its (block-wise)
         adjoint.

@compatibility(numpy)
Equivalent to np.linalg.triangular_solve
@end_compatibility"
Ttype:
2*MSolves systems of linear equations with upper or lower triangular matrices by2backsubstitution.

`matrix` is a tensor of shape `[..., M, M]` whose inner-most 2 dimensions form
square matrices. If `lower` is `True` then the strictly upper triangular part
of each inner-most matrix is assumed to be zero and not accessed.
If `lower` is False then the strictly lower triangular part of each inner-most
matrix is assumed to be zero and not accessed.
`rhs` is a tensor of shape `[..., M, K]`.

The output is a tensor of shape `[..., M, K]`. If `adjoint` is
`True` then the innermost matrices in output` satisfy matrix equations
`matrix[..., :, :] * output[..., :, :] = rhs[..., :, :]`.
If `adjoint` is `False` then the strictly then the  innermost matrices in
`output` satisfy matrix equations
`adjoint(matrix[..., i, k]) * output[..., k, j] = rhs[..., i, j]`.
¾
Max!
inputThe tensor to reduce."T4
reduction_indicesThe dimensions to reduce."Tidx 
outputThe reduced tensor."T"H
	keep_dimsbool( "1If true, retain reduced dimensions with length 1."
Ttype:
2	"
Tidxtype0:
2	*?Computes the maximum of elements across dimensions of a tensor.2÷Reduces `input` along the dimensions given in `reduction_indices`. Unless
`keep_dims` is true, the rank of the tensor is reduced by 1 for each entry in
`reduction_indices`. If `keep_dims` is true, the reduced dimensions are
retained with length 1.
ģ
MaxPool#
input4-D input to pool over."T*
outputThe max pooled output tensor."T"
Ttype0:
2"V
ksize	list(int)">The size of the window for each dimension of the input tensor.(0"b
strides	list(int)"HThe stride of the sliding window for each dimension of the
input tensor.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"Ķ
data_formatstringNHWC"Specify the data format of the input and output data. With the
default format "NHWC", the data is stored in the order of:
    [batch, in_height, in_width, in_channels].
Alternatively, the format could be "NCHW", the data storage order of:
    [batch, in_channels, in_height, in_width].:
NHWCNCHW*"Performs max pooling on the input.
Ė
	MaxPool3DM
inputAShape `[batch, depth, rows, cols, channels]` tensor to pool over."T*
outputThe max pooled output tensor."T"
ksize	list(int)"{1-D tensor of length 5. The size of the window for each dimension of
the input tensor. Must have `ksize[0] = ksize[4] = 1`.(0"
strides	list(int)"1-D tensor of length 5. The stride of the sliding window for each
dimension of `input`. Must have `strides[0] = strides[4] = 1`.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"
Ttype:
2	*%Performs 3D max pooling on the input.

MaxPool3DGrad*

orig_inputThe original input tensor.,
orig_outputThe original output tensor.K
grad@Output backprop of shape `[batch, depth, rows, cols, channels]`."T
output"T"
ksize	list(int)"{1-D tensor of length 5. The size of the window for each dimension of
the input tensor. Must have `ksize[0] = ksize[4] = 1`.(0"
strides	list(int)"1-D tensor of length 5. The stride of the sliding window for each
dimension of `input`. Must have `strides[0] = strides[4] = 1`.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"
Ttype:
2	*+Computes gradients of max pooling function.
ü
MaxPoolGrad+

orig_inputThe original input tensor."T-
orig_outputThe original output tensor."T;
grad04-D.  Gradients w.r.t. the output of `max_pool`."T6
output)Gradients w.r.t. the input to `max_pool`."T"V
ksize	list(int)">The size of the window for each dimension of the input tensor.(0"b
strides	list(int)"HThe stride of the sliding window for each dimension of the
input tensor.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"Ķ
data_formatstringNHWC"Specify the data format of the input and output data. With the
default format "NHWC", the data is stored in the order of:
    [batch, in_height, in_width, in_channels].
Alternatively, the format could be "NCHW", the data storage order of:
    [batch, in_channels, in_height, in_width].:
NHWCNCHW"
Ttype0:
2*.Computes gradients of the maxpooling function.

MaxPoolGradWithArgmax
inputThe original input."Ti
grad^4-D with shape `[batch, height, width, channels]`.  Gradients w.r.t. the
output of `max_pool`."TZ
argmaxGThe indices of the maximum values chosen for each output of `max_pool`."Targmax6
output)Gradients w.r.t. the input of `max_pool`."T"V
ksize	list(int)">The size of the window for each dimension of the input tensor.(0"b
strides	list(int)"HThe stride of the sliding window for each dimension of the
input tensor.(0"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"
Targmaxtype:
2	"
Ttype0:
2*.Computes gradients of the maxpooling function.

MaxPoolWithArgmaxS
inputG4-D with shape `[batch, height, width, channels]`.  Input to pool over."T*
outputThe max pooled output tensor."TX
argmaxE4-D.  The flattened indices of the max values chosen for each output."Targmax"V
ksize	list(int)">The size of the window for each dimension of the input tensor.(0"b
strides	list(int)"HThe stride of the sliding window for each dimension of the
input tensor.(0"
Targmaxtype0	:
2	"I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID"
Ttype0:
2*JPerforms max pooling on the input and outputs both max values and indices.2¢The indices in `argmax` are flattened, so that a maximum value at position
`[b, y, x, c]` becomes flattened index
`((b * height + y) * width + x) * channels + c`.

Maximum
x"T
y"T
z"T"
Ttype:	
2	*=Returns the max of x and y (i.e. x > y ? x : y) element-wise.2*NOTE*: `Maximum` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)
¼
Mean!
inputThe tensor to reduce."T4
reduction_indicesThe dimensions to reduce."Tidx 
outputThe reduced tensor."T"H
	keep_dimsbool( "1If true, retain reduced dimensions with length 1."
Ttype:
2	"
Tidxtype0:
2	*<Computes the mean of elements across dimensions of a tensor.2÷Reduces `input` along the dimensions given in `reduction_indices`. Unless
`keep_dims` is true, the rank of the tensor is reduced by 1 for each entry in
`reduction_indices`. If `keep_dims` is true, the reduced dimensions are
retained with length 1.
·
MergeN
inputs>The input tensors, exactly one of which will become available."T*N7
output*Will be set to the available input tensor."TB
value_index1The index of the chosen input tensor in `inputs`."	
Ttype"
Nint(0*DForwards the value of an available tensor from `inputs` to `output`.2`Merge` waits for at least one of the tensors in `inputs` to become available.
It is usually combined with `Switch` to implement branching.

`Merge` forwards the first tensor for become available to `output`, and sets
`value_index` to its index in `inputs`.
’
MergeSummary]
inputsNCan be of any shape.  Each must contain serialized `Summary` protocol
buffers.*N:
summary-Scalar. Serialized `Summary` protocol buffer."
Nint(0*Merges summaries.2²This op creates a
[`Summary`](https://www.tensorflow.org/code/tensorflow/core/framework/summary.proto)
protocol buffer that contains the union of all the values in the input
summaries.

When the Op is run, it reports an `InvalidArgument` error if multiple values
in the summaries to merge use the same tag.
©
MergeV2Checkpoints=
checkpoint_prefixes$prefixes of V2 checkpoints to merge.u
destination_prefix]scalar.  The desired final prefix.  Allowed to be the same
as one of the checkpoint_prefixes."'
delete_old_dirsbool("
see above.*JV2 format specific: merges the metadata files of sharded checkpoints.  The2ēresult is one logical checkpoint, with one physical metadata file and renamed
data files.

Intended for "grouping" multiple checkpoints in a sharded checkpoint setup.

If delete_old_dirs is true, attempts to delete recursively the dirname of each
path in the input checkpoint_prefixes.  This is useful when those paths are non
user-facing temporary locations.
¾
Min!
inputThe tensor to reduce."T4
reduction_indicesThe dimensions to reduce."Tidx 
outputThe reduced tensor."T"H
	keep_dimsbool( "1If true, retain reduced dimensions with length 1."
Ttype:
2	"
Tidxtype0:
2	*?Computes the minimum of elements across dimensions of a tensor.2÷Reduces `input` along the dimensions given in `reduction_indices`. Unless
`keep_dims` is true, the rank of the tensor is reduced by 1 for each entry in
`reduction_indices`. If `keep_dims` is true, the reduced dimensions are
retained with length 1.

Minimum
x"T
y"T
z"T"
Ttype:	
2	*=Returns the min of x and y (i.e. x < y ? x : y) element-wise.2*NOTE*: `Minimum` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)

	MirrorPad*
inputThe input tensor to be padded."T
paddingsmA two-column matrix specifying the padding sizes. The number of
rows must be the same as the rank of `input`."	Tpaddings
outputThe padded tensor."T"	
Ttype"
	Tpaddingstype0:
2	"ó
modestring"ŹEither `REFLECT` or `SYMMETRIC`. In reflect mode the padded regions
do not include the borders, while in symmetric mode the padded regions
do include the borders. For example, if `input` is `[1, 2, 3]` and `paddings`
is `[0, 2]`, then the output is `[1, 2, 3, 2, 1]` in reflect mode, and
it is `[1, 2, 3, 3, 2]` in symmetric mode.:
REFLECT	SYMMETRIC*#Pads a tensor with mirrored values.2óThis operation pads a `input` with mirrored values according to the `paddings`
you specify. `paddings` is an integer tensor with shape `[n, 2]`, where n is
the rank of `input`. For each dimension D of `input`, `paddings[D, 0]` indicates
how many values to add before the contents of `input` in that dimension, and
`paddings[D, 1]` indicates how many values to add after the contents of `input`
in that dimension. Both `paddings[D, 0]` and `paddings[D, 1]` must be no greater
than `input.dim_size(D)` (or `input.dim_size(D) - 1`) if `copy_border` is true
(if false, respectively).

The padded size of each dimension D of the output is:

`paddings(D, 0) + input.dim_size(D) + paddings(D, 1)`

For example:

```prettyprint
# 't' is [[1, 2, 3], [4, 5, 6]].
# 'paddings' is [[1, 1]], [2, 2]].
# 'mode' is SYMMETRIC.
# rank of 't' is 2.
pad(t, paddings) ==> [[2, 1, 1, 2, 3, 3, 2]
                      [2, 1, 1, 2, 3, 3, 2]
                      [5, 4, 4, 5, 6, 6, 5]
                      [5, 4, 4, 5, 6, 6, 5]]
```
“
MirrorPadGrad*
inputThe input tensor to be folded."T
paddingsmA two-column matrix specifying the padding sizes. The number of
rows must be the same as the rank of `input`."	Tpaddings
outputThe folded tensor."T"	
Ttype"
	Tpaddingstype0:
2	"L
modestring"$The mode used in the `MirrorPad` op.:
REFLECT	SYMMETRIC*EGradient op for `MirrorPad` op. This op folds a mirror-padded tensor.2This operation folds the padded areas of `input` by `MirrorPad` according to the
`paddings` you specify. `paddings` must be the same as `paddings` argument
given to the corresponding `MirrorPad` op.

The folded size of each dimension D of the output is:

`input.dim_size(D) - paddings(D, 0) - paddings(D, 1)`

For example:

```prettyprint
# 't' is [[1, 2, 3], [4, 5, 6], [7, 8, 9]].
# 'paddings' is [[0, 1]], [0, 1]].
# 'mode' is SYMMETRIC.
# rank of 't' is 2.
pad(t, paddings) ==> [[ 1,  5]
                      [11, 28]]
```
ä
Mod
x"T
y"T
z"T"
Ttype:
2	*+Returns element-wise remainder of division.2*NOTE*: `Mod` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)
Ž
Mul
x"T
y"T
z"T"
Ttype:
2	*Returns x * y element-wise.2*NOTE*: `Mul` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)
»
Multinomial
logits2-D Tensor with shape `[batch_size, num_classes]`.  Each slice `[i, :]`
represents the unnormalized log probabilities for all classes."TP
num_samples?0-D.  Number of independent samples to draw for each row slice.
output2-D Tensor with shape `[batch_size, num_samples]`.  Each slice `[i, :]`
contains the drawn class labels with range `[0, num_classes)`.	"„
seedint "If either seed or seed2 is set to be non-zero, the internal random number
generator is seeded by the given seed.  Otherwise, a random seed is used."8
seed2int "&A second seed to avoid seed collision."
Ttype:
2		*.Draws samples from a multinomial distribution.
Ó	
MutableDenseHashTable
	empty_keyhThe key used to represent empty key buckets internally. Must not
be used in insert or lookup operations."	key_dtype'
table_handleHandle to a table."{
	containerstring "bIf non-empty, this table is placed in the given container.
Otherwise, a default container is used."l
shared_namestring "QIf non-empty, this table is shared under the given name across
multiple sessions."!
use_node_name_sharingbool( "*
	key_dtypetype"Type of the table keys.".
value_dtypetype"Type of the table values."2
value_shapeshape: "The shape of each value."a
initial_num_bucketsint"?The initial number of hash table buckets. Must be a power
to 2."
max_load_factorfloat%ĶĢL?"tThe maximum ratio between number of entries and number of
buckets before growing the table. Must be between 0 and 1.*KCreates an empty hash table that uses tensors as the backing store. It uses2¤"open addressing" with quadratic reprobing to resolve collisions.

This op creates a mutable hash table, specifying the type of its keys and
values. Each value must be a scalar. Data can be inserted into the table using
the insert operations. It does not support the initialization operation.
ö
MutableHashTable'
table_handleHandle to a table."{
	containerstring "bIf non-empty, this table is placed in the given container.
Otherwise, a default container is used."l
shared_namestring "QIf non-empty, this table is shared under the given name across
multiple sessions."m
use_node_name_sharingbool( "JIf true and shared_name is empty, the table is shared
using the node name."*
	key_dtypetype"Type of the table keys.".
value_dtypetype"Type of the table values.*Creates an empty hash table.2įThis op creates a mutable hash table, specifying the type of its keys and
values. Each value must be a scalar. Data can be inserted into the table using
the insert operations. It does not support the initialization operation.
Ķ
MutableHashTableOfTensors'
table_handleHandle to a table."{
	containerstring "bIf non-empty, this table is placed in the given container.
Otherwise, a default container is used."l
shared_namestring "QIf non-empty, this table is shared under the given name across
multiple sessions."!
use_node_name_sharingbool( "*
	key_dtypetype"Type of the table keys.".
value_dtypetype"Type of the table values."
value_shapeshape: *Creates an empty hash table.2įThis op creates a mutable hash table, specifying the type of its keys and
values. Each value must be a vector. Data can be inserted into the table using
the insert operations. It does not support the initialization operation.
s
Neg
x"T
y"T"
Ttype:
	2	*/Computes numerical negative value element-wise.2I.e., \\(y = -x\\).
Ŗ
NegTrain"
w_ininput word embedding.$
w_outoutput word embedding.#
examplesA vector of word ids.!
labelsA vector of word ids.
lr";
vocab_count	list(int)"!Count of words in the vocabulary."D
num_negative_samplesint"'Number of negative samples per example.*Training via negative sampling.B]YMoving word2vec into tensorflow_models/tutorials and deprecating its ops here as a result
ø
NextIterationA
data6The tensor to be made available to the next iteration."T'
outputThe same tensor as `data`."T"	
Ttype*0Makes its input available to the next iteration.
E
NoOp*=Does nothing. Only useful as a placeholder for control edges.
ļ
NonMaxSuppression8
boxes-A 2-D float tensor of shape `[num_boxes, 4]`.
scorestA 1-D float tensor of shape `[num_boxes]` representing a single
score corresponding to each box (each row of boxes).|
max_output_sizegA scalar integer tensor representing the maximum number of
boxes to be selected by non max suppression.
selected_indiceszA 1-D integer tensor of shape `[M]` representing the selected
indices from the boxes tensor, where `M <= max_output_size`."
iou_thresholdfloat%   ?"cA float representing the threshold for deciding whether boxes
overlap too much with respect to IOU.*IGreedily selects a subset of bounding boxes in descending order of score,2»pruning away boxes that have high intersection-over-union (IOU) overlap
with previously selected boxes.  Bounding boxes are supplied as
[y1, x1, y2, x2], where (y1, x1) and (y2, x2) are the coordinates of any
diagonal pair of box corners and the coordinates can be provided as normalized
(i.e., lying in the interval [0, 1]) or absolute.  Note that this algorithm
is agnostic to where the origin is in the coordinate system.  Note that this
algorithm is invariant to orthogonal transformations and translations
of the coordinate system; thus translating or reflections of the coordinate
system result in the same boxes being selected by the algorithm.

The output of this operation is a set of integers indexing into the input
collection of bounding boxes representing the selected boxes.  The bounding
box coordinates corresponding to the selected indices can then be obtained
using the `tf.gather operation`.  For example:

  selected_indices = tf.image.non_max_suppression(
      boxes, scores, max_output_size, iou_threshold)
  selected_boxes = tf.gather(boxes, selected_indices)

NotEqual
x"T
y"T
z
"
Ttype:
2	
*1Returns the truth value of (x != y) element-wise.2*NOTE*: `NotEqual` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)
Ö
OneHot#
indicesA tensor of indices."TI@
depth5A scalar defining the depth of the one hot dimension.S
on_valueDA scalar defining the value to fill in output when `indices[j] = i`."TU
	off_valueEA scalar defining the value to fill in output when `indices[j] != i`."T 
outputThe one-hot tensor."T"P
axisint’’’’’’’’’"6The axis to fill (default: -1, a new inner-most axis)."	
Ttype"
TItype0	:
2	*Returns a one-hot tensor.2The locations represented by indices in `indices` take value `on_value`,
while all other locations take value `off_value`.

If the input `indices` is rank `N`, the output will have rank `N+1`,
The new axis is created at dimension `axis` (default: the new axis is
appended at the end).

If `indices` is a scalar the output shape will be a vector of length `depth`.

If `indices` is a vector of length `features`, the output shape will be:
```
  features x depth if axis == -1
  depth x features if axis == 0
```

If `indices` is a matrix (batch) with shape `[batch, features]`,
the output shape will be:
```
  batch x features x depth if axis == -1
  batch x depth x features if axis == 1
  depth x batch x features if axis == 0
```


Examples
=========

Suppose that

```
  indices = [0, 2, -1, 1]
  depth = 3
  on_value = 5.0
  off_value = 0.0
  axis = -1
```

Then output is `[4 x 3]`:

    ```output =
      [5.0 0.0 0.0]  // one_hot(0)
      [0.0 0.0 5.0]  // one_hot(2)
      [0.0 0.0 0.0]  // one_hot(-1)
      [0.0 5.0 0.0]  // one_hot(1)
    ```

Suppose that

```
  indices = [0, 2, -1, 1]
  depth = 3
  on_value = 0.0
  off_value = 3.0
  axis = 0
```

Then output is `[3 x 4]`:

    ```output =
      [0.0 3.0 3.0 3.0]
      [3.0 3.0 3.0 0.0]
      [3.0 3.0 3.0 3.0]
      [3.0 0.0 3.0 3.0]
    //  ^                one_hot(0)
    //      ^            one_hot(2)
    //          ^        one_hot(-1)
    //              ^    one_hot(1)
    ```
Suppose that

```
  indices = [[0, 2], [1, -1]]
  depth = 3
  on_value = 1.0
  off_value = 0.0
  axis = -1
```

Then output is `[2 x 2 x 3]`:

    ```output =
      [
        [1.0, 0.0, 0.0]  // one_hot(0)
        [0.0, 0.0, 1.0]  // one_hot(2)
      ][
        [0.0, 1.0, 0.0]  // one_hot(1)
        [0.0, 0.0, 0.0]  // one_hot(-1)
      ]```
ō
Pack/
valuesMust be of same shape and type."T*N
outputThe packed tensor."T"
Nint(0"	
Ttype"t
axisint "cDimension along which to pack.  Negative values wrap around, so the
valid range is `[-(R+1), R+1)`.*BPacks a list of `N` rank-`R` tensors into one rank-`(R+1)` tensor.2ĘPacks the `N` tensors in `values` into a tensor with rank one higher than each
tensor in `values`, by packing them along the `axis` dimension.
Given a list of tensors of shape `(A, B, C)`;

if `axis == 0` then the `output` tensor will have the shape `(N, A, B, C)`.
if `axis == 1` then the `output` tensor will have the shape `(A, N, B, C)`.
Etc.

For example:

```prettyprint
# 'x' is [1, 4]
# 'y' is [2, 5]
# 'z' is [3, 6]
pack([x, y, z]) => [[1, 4], [2, 5], [3, 6]]  # Pack along first dim.
pack([x, y, z], axis=1) => [[1, 2, 3], [4, 5, 6]]
```

This is the opposite of `unpack`.

Pad

input"T
paddings"	Tpaddings
output"T"	
Ttype"
	Tpaddingstype0:
2	*Pads a tensor with zeros.2This operation pads a `input` with zeros according to the `paddings` you
specify. `paddings` is an integer tensor with shape `[Dn, 2]`, where n is the
rank of `input`. For each dimension D of `input`, `paddings[D, 0]` indicates
how many zeros to add before the contents of `input` in that dimension, and
`paddings[D, 1]` indicates how many zeros to add after the contents of `input`
in that dimension.

The padded size of each dimension D of the output is:

`paddings(D, 0) + input.dim_size(D) + paddings(D, 1)`

For example:

```prettyprint
# 't' is [[1, 1], [2, 2]]
# 'paddings' is [[1, 1], [2, 2]]
# rank of 't' is 2
pad(t, paddings) ==> [[0, 0, 0, 0, 0, 0]
                      [0, 0, 1, 1, 0, 0]
                      [0, 0, 2, 2, 0, 0]
                      [0, 0, 0, 0, 0, 0]]
```
Š

PaddingFIFOQueue'
handleThe handle to the queue."I
component_types
list(type)"&The type of each component in a value.(0"½
shapeslist(shape)
 "The shape of each component in a value. The length of this attr must
be either 0 or the same as the length of component_types.
Shapes of fixed rank but variable size are allowed by setting
any shape dimension to -1.  In this case, the inputs' shape may vary along
the given dimension, and DequeueMany will pad the given dimension with
zeros up to the maximum shape of all elements in the given batch.
If the length of this attr is 0, different queue elements may have
different ranks and shapes, but only one element may be dequeued at a time.("v
capacityint’’’’’’’’’"XThe upper bound on the number of elements in this queue.
Negative numbers mean no limit."{
	containerstring "bIf non-empty, this queue is placed in the given container.
Otherwise, a default container is used."q
shared_namestring "VIf non-empty, this queue will be shared under the given name
across multiple sessions.*;A queue that produces elements in first-in first-out order.2ßVariable-size shapes are allowed by setting the corresponding shape dimensions
to 0 in the shape attr.  In this case DequeueMany will pad up to the maximum
size of any given element in the minibatch.  See below for details.
Ļ

PaddingFIFOQueueV2$
handleThe handle to the queue."I
component_types
list(type)"&The type of each component in a value.(0"½
shapeslist(shape)
 "The shape of each component in a value. The length of this attr must
be either 0 or the same as the length of component_types.
Shapes of fixed rank but variable size are allowed by setting
any shape dimension to -1.  In this case, the inputs' shape may vary along
the given dimension, and DequeueMany will pad the given dimension with
zeros up to the maximum shape of all elements in the given batch.
If the length of this attr is 0, different queue elements may have
different ranks and shapes, but only one element may be dequeued at a time.("v
capacityint’’’’’’’’’"XThe upper bound on the number of elements in this queue.
Negative numbers mean no limit."{
	containerstring "bIf non-empty, this queue is placed in the given container.
Otherwise, a default container is used."q
shared_namestring "VIf non-empty, this queue will be shared under the given name
across multiple sessions.*;A queue that produces elements in first-in first-out order.2ßVariable-size shapes are allowed by setting the corresponding shape dimensions
to 0 in the shape attr.  In this case DequeueMany will pad up to the maximum
size of any given element in the minibatch.  See below for details.
š
ParallelConcatg
valuesWTensors to be concatenated. All must have size 1 in the first dimension
and same shape."T*N%
outputThe concatenated tensor."T"
Nint(0"	
Ttype"
shapeshape"the final shape of the result; should be equal to the shapes of any input
but with the number of input values in the first dimension.*=Concatenates a list of `N` tensors along the first dimension.2ÜThe input tensors are all required to have size 1 in the first dimension.

For example:

```prettyprint
# 'x' is [[1, 4]]
# 'y' is [[2, 5]]
# 'z' is [[3, 6]]
parallel_concat([x, y, z]) => [[1, 4], [2, 5], [3, 6]]  # Pack along first dim.
```

The difference between concat and parallel_concat is that concat requires all
of the inputs be computed before the operation will begin but doesn't require
that the input shapes be known during graph construction.  Parallel concat
will copy pieces of the input into the output as they become available, in
some situations this can provide a performance benefit.
®
ParameterizedTruncatedNormalU
shapeIThe shape of the output tensor. Batches are indexed by the 0th dimension."T1
means!The mean parameter of each batch."dtypeX
stdevsGThe standard deviation parameter of each batch. Must be greater than 0."dtype7
minvals%The minimum cutoff. May be -infinity."dtypeh
maxvalsVThe maximum cutoff. May be +infinity, and must be more than the minval
for each batch."dtype
outputA matrix of shape num_batches x samples_per_batch, filled with random
truncated normal values using the parameters for each row."dtype"©
seedint "If either `seed` or `seed2` are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."8
seed2int "&A second seed to avoid seed collision."/
dtypetype"The type of the output.:
2"
Ttype:
2	*NOutputs random values from a normal distribution. The parameters may each be a2uscalar which applies to the entire output, or a vector of length shape[0] which
stores the parameters for each batch.
æ
ParseExampleP

serialized@A vector containing a batch of binary serialized Example protos.
namesA vector containing the names of the serialized protos.
May contain, for example, table key (descriptive) names for the
corresponding serialized protos.  These are purely useful for debugging
purposes, and the presence of values here has no effect on the output.
May also be an empty vector if no names are available.
If non-empty, this vector must be the same length as "serialized".
sparse_keysvA list of Nsparse string Tensors (scalars).
The keys expected in the Examples' features associated with sparse values.*Nsparse

dense_keystA list of Ndense string Tensors (scalars).
The keys expected in the Examples' features associated with dense values.*Ndense
dense_defaults’A list of Ndense Tensors (some may be empty).
dense_defaults[j] provides default values
when the example's feature_map lacks dense_key[j].  If an empty Tensor is
provided for dense_defaults[j], then the Feature dense_keys[j] is required.
The input type is inferred from dense_defaults[j], even when it's empty.
If dense_defaults[j] is not empty, its shape must match dense_shapes[j].2Tdense
sparse_indices	*Nsparse
sparse_values2sparse_types
sparse_shapes	*Nsparse
dense_values2Tdense"
Nsparseint("
Ndenseint("č
sparse_types
list(type)"ĄA list of Nsparse types; the data types of data in each Feature
given in sparse_keys.
Currently the ParseExample supports DT_FLOAT (FloatList),
DT_INT64 (Int64List), and DT_STRING (BytesList).(:
2	"
Tdense
list(type)(:
2	"”
dense_shapeslist(shape)"A list of Ndense shapes; the shapes of data in each Feature
given in dense_keys.
The number of elements in the Feature corresponding to dense_key[j]
must always equal dense_shapes[j].NumEntries().
If dense_shapes[j] == (D0, D1, ..., DN) then the shape of output
Tensor dense_values[j] will be (|serialized|, D0, D1, ..., DN):
The dense outputs are just the inputs row-stacked by batch.(*LTransforms a vector of brain.Example protos (as strings) into typed tensors.
Ž
ParseSingleSequenceExampleN

serialized>A scalar containing a binary serialized SequenceExample proto. 
(feature_list_dense_missing_assumed_emptyńA vector listing the
FeatureList keys which may be missing from the SequenceExample.  If the
associated FeatureList is missing, it is treated as empty.  By default,
any FeatureList not listed in this vector must exist in the SequenceExample.±
context_sparse_keysA list of Ncontext_sparse string Tensors (scalars).
The keys expected in the Examples' features associated with context_sparse
values.*Ncontext_sparseµ
context_dense_keysA list of Ncontext_dense string Tensors (scalars).
The keys expected in the SequenceExamples' context features associated with
dense values.*Ncontext_dense²
feature_list_sparse_keys~A list of Nfeature_list_sparse string Tensors
(scalars).  The keys expected in the FeatureLists associated with sparse
values.*Nfeature_list_sparseŹ
feature_list_dense_keysA list of Nfeature_list_dense string Tensors (scalars).
The keys expected in the SequenceExamples' feature_lists associated
with lists of dense values.*Nfeature_list_denseņ
context_dense_defaultsĒA list of Ncontext_dense Tensors (some may be empty).
context_dense_defaults[j] provides default values
when the SequenceExample's context map lacks context_dense_key[j].
If an empty Tensor is provided for context_dense_defaults[j],
then the Feature context_dense_keys[j] is required.
The input type is inferred from context_dense_defaults[j], even when it's
empty.  If context_dense_defaults[j] is not empty, its shape must match
context_dense_shapes[j].2Tcontext_denseĘ

debug_nameµA scalar containing the name of the serialized proto.
May contain, for example, table key (descriptive) name for the
corresponding serialized proto.  This is purely useful for debugging
purposes, and the presence of values here has no effect on the output.
May also be an empty scalar if no name is available.+
context_sparse_indices	*Ncontext_sparse-
context_sparse_values2context_sparse_types*
context_sparse_shapes	*Ncontext_sparse&
context_dense_values2Tcontext_dense5
feature_list_sparse_indices	*Nfeature_list_sparse7
feature_list_sparse_values2feature_list_sparse_types4
feature_list_sparse_shapes	*Nfeature_list_sparse5
feature_list_dense_values2feature_list_dense_types"
Ncontext_sparseint ("
Ncontext_denseint ("!
Nfeature_list_sparseint (" 
Nfeature_list_denseint ("
context_sparse_types
list(type)
 "ęA list of Ncontext_sparse types; the data types of data in
each context Feature given in context_sparse_keys.
Currently the ParseSingleSequenceExample supports DT_FLOAT (FloatList),
DT_INT64 (Int64List), and DT_STRING (BytesList).(:
2	"+
Tcontext_dense
list(type)
 (:
2	"5
feature_list_dense_types
list(type)
 (:
2	"į
context_dense_shapeslist(shape)
 "µA list of Ncontext_dense shapes; the shapes of data in
each context Feature given in context_dense_keys.
The number of elements in the Feature corresponding to context_dense_key[j]
must always equal context_dense_shapes[j].NumEntries().
The shape of context_dense_values[j] will match context_dense_shapes[j].("„
feature_list_sparse_types
list(type)
 "ģA list of Nfeature_list_sparse types; the data types
of data in each FeatureList given in feature_list_sparse_keys.
Currently the ParseSingleSequenceExample supports DT_FLOAT (FloatList),
DT_INT64 (Int64List), and DT_STRING (BytesList).(:
2	"“
feature_list_dense_shapeslist(shape)
 "A list of Nfeature_list_dense shapes; the shapes of
data in each FeatureList given in feature_list_dense_keys.
The shape of each Feature in the FeatureList corresponding to
feature_list_dense_key[j] must always equal
feature_list_dense_shapes[j].NumEntries().(*PTransforms a scalar brain.SequenceExample proto (as strings) into typed tensors.
ō
ParseTensorJ

serialized:A scalar string containing a serialized TensorProto proto.0
outputA Tensor of type `out_type`."out_type"”
out_typetype"The type of the serialized tensor.  The provided type must match the
type of the serialized tensor and no implicit conversion will take place.*CTransforms a serialized tensorflow.TensorProto proto into a Tensor.
”
PlaceholderU
outputDA placeholder tensor that must be replaced using the feed mechanism."dtype"2
dtypetype"#The type of elements in the tensor."r
shapeshape: "^(Optional) The shape of the tensor. If the shape has 0 dimensions, the
shape is unconstrained.*CA placeholder op for a value that will be fed into the computation.2ĶN.B. This operation will fail with an error if it is executed. It is
intended as a way to represent a value that will always be fed, and to
provide attrs that enable the fed value to be checked at runtime.
Ä
PlaceholderV2U
outputDA placeholder tensor that must be replaced using the feed mechanism."dtype"2
dtypetype"#The type of elements in the tensor."
shapeshape"The shape of the tensor. The shape can be any partially-specified
shape.  To be unconstrained, pass in a shape with unknown rank.*CA placeholder op for a value that will be fed into the computation.2ĶN.B. This operation will fail with an error if it is executed. It is
intended as a way to represent a value that will always be fed, and to
provide attrs that enable the fed value to be checked at runtime.
ķ
PlaceholderWithDefaultF
input6The default value to produce when `output` is not fed."dtypeP
output?A placeholder tensor that defaults to `input` if it is not fed."dtype"2
dtypetype"#The type of elements in the tensor.";
shapeshape"+The (possibly partial) shape of the tensor.*HA placeholder op that passes through `input` when its output is not fed.
ņ
	Polygamma
a"T
x"T
z"T"
Ttype:
2*3Compute the polygamma function \\(\psi^{(n)}(x)\\).2The polygamma function is defined as:

```
\psi^{(n)}(x) = \frac{d^n}{dx^n} \psi(x)
```
where \\(\psi(x)\\) is the digamma function.
Ł
Pow
x"T
y"T
z"T"
Ttype:
	2	*+Computes the power of one value to another.2ōGiven a tensor `x` and a tensor `y`, this operation computes \\(x^y\\) for
corresponding elements in `x` and `y`. For example:

```
# tensor 'x' is [[2, 2]], [3, 3]]
# tensor 'y' is [[8, 16], [2, 3]]
tf.pow(x, y) ==> [[256, 65536], [9, 27]]
```
ō
PreventGradient

input"T
output"T"	
Ttype*AAn identity op that triggers an error if a gradient is requested.2łWhen executed in a graph, this op outputs its input tensor as-is.

When building ops to compute gradients, the TensorFlow gradient system
will return an error when trying to lookup the gradient of this op,
because no gradient must ever be registered for this function.  This
op exists to prevent subtle bugs from silently returning unimplemented
gradients in some corner cases.

Print)
inputThe tensor passed to `output`"T?
data4A list of tensors to print out when op is evaluated.2U,
output= The unmodified `input` tensor"T"	
Ttype"
U
list(type)(0"=
messagestring "&A string, prefix of the error message."U
first_nint’’’’’’’’’"8Only log `first_n` number of times. -1 disables logging."B
	summarizeint",Only print this many entries of each tensor.*Prints a list of tensors.2EPasses `input` through to `output` and prints `data` when evaluating.
¦	
PriorityQueue'
handleThe handle to the queue."K
component_types
list(type)
 "&The type of each component in a value.("
shapeslist(shape)"The shape of each component in a value. The length of this attr must
be either 0 or the same as the length of component_types. If the length of
this attr is 0, the shapes of queue elements are not constrained, and
only one element may be dequeued at a time.("v
capacityint’’’’’’’’’"XThe upper bound on the number of elements in this queue.
Negative numbers mean no limit."{
	containerstring "bIf non-empty, this queue is placed in the given container.
Otherwise, a default container is used."q
shared_namestring "VIf non-empty, this queue will be shared under the given name
across multiple sessions.*CA queue that produces elements sorted by the first component value.2ŠNote that the PriorityQueue requires the first component of any element
to be a scalar int64, in addition to the other elements declared by
component_types.  Therefore calls to Enqueue and EnqueueMany (resp. Dequeue
and DequeueMany) on a PriorityQueue will all require (resp. output) one extra
entry in their input (resp. output) lists.
„	
PriorityQueueV2$
handleThe handle to the queue."K
component_types
list(type)
 "&The type of each component in a value.("
shapeslist(shape)"The shape of each component in a value. The length of this attr must
be either 0 or the same as the length of component_types. If the length of
this attr is 0, the shapes of queue elements are not constrained, and
only one element may be dequeued at a time.("v
capacityint’’’’’’’’’"XThe upper bound on the number of elements in this queue.
Negative numbers mean no limit."{
	containerstring "bIf non-empty, this queue is placed in the given container.
Otherwise, a default container is used."q
shared_namestring "VIf non-empty, this queue will be shared under the given name
across multiple sessions.*CA queue that produces elements sorted by the first component value.2ŠNote that the PriorityQueue requires the first component of any element
to be a scalar int64, in addition to the other elements declared by
component_types.  Therefore calls to Enqueue and EnqueueMany (resp. Dequeue
and DequeueMany) on a PriorityQueue will all require (resp. output) one extra
entry in their input (resp. output) lists.
æ
Prod!
inputThe tensor to reduce."T4
reduction_indicesThe dimensions to reduce."Tidx 
outputThe reduced tensor."T"H
	keep_dimsbool( "1If true, retain reduced dimensions with length 1."
Ttype:
2	"
Tidxtype0:
2	*?Computes the product of elements across dimensions of a tensor.2÷Reduces `input` along the dimensions given in `reduction_indices`. Unless
`keep_dims` is true, the rank of the tensor is reduced by 1 for each entry in
`reduction_indices`. If `keep_dims` is true, the reduced dimensions are
retained with length 1.

PyFunc@
input2List of Tensors that will provide input to the Op.2Tin(
outputThe outputs from the Op.2Tout"Y
tokenstring"HA token representing a registered python function in this address space."8
Tin
list(type)"#Data types of the inputs to the op.("t
Tout
list(type)"^Data types of the outputs from the op.
The length of the list specifies the number of outputs.(*9Invokes a python function to compute func(input)->output.2TThis operation is considered stateful. For a stateless version, see
PyFuncStateless.

PyFuncStateless
input2Tin
output2Tout"
tokenstring"
Tin
list(type)("
Tout
list(type)(*A stateless version of PyFunc.
Ł
Qr
inputA tensor of shape `[..., M, N]` whose inner-most 2 dimensions
form matrices of size `[M, N]`. Let `P` be the minimum of `M` and `N`."T”
qOrthonormal basis for range of `a`. If `full_matrices` is `False` then
shape is `[..., M, P]`; if `full_matrices` is `True` then shape is
`[..., M, M]`."T
rTriangular factor. If `full_matrices` is `False` then shape is
`[..., P, N]`. If `full_matrices` is `True` then shape is `[..., M, N]`."T"
full_matricesbool( "mIf true, compute full-sized `q` and `r`. If false
(the default), compute only the leading `P` columns of `q`."
Ttype:
2*7Computes the QR decompositions of one or more matrices.2®Computes the QR decomposition of each inner matrix in `tensor` such that
`tensor[..., :, :] = q[..., :, :] * r[..., :,:])`

```prettyprint
# a is a tensor.
# q is a tensor of orthonormal matrices.
# r is a tensor of upper triangular matrices.
q, r = qr(a)
q_full, r_full = qr(a, full_matrices=True)
```
Ķ
QuantizeAndDequantize3
input'Tensor to quantize and then dequantize."T
output"T"D
signed_inputbool("*If the quantization is signed or unsigned."6
num_bitsint"!The bitwidth of the quantization."U
range_givenbool( "<If the range is given or should be computed from the tensor."K
	input_minfloat%    "0If range is given, this is the min of the range."K
	input_maxfloat%    "0If range is given, this is the max of the range."
Ttype:
2*$Quantizes then dequantizes a tensor.2ÉThis op simulates the precision loss from the quantized forward pass by:
1. Quantizing the tensor to fixed point numbers, which should match the target
   quantization method when it is used in inference.
2. Dequantizing it back to floating point numbers for the following ops, most
   likely matmul.

There are different ways to quantize. This version does not use the full range
of the output type, choosing to elide the lowest possible value for symmetry
(e.g., output range is -127 to 127, not -128 to 127 for signed 8 bit
quantization), so that 0.0 maps to 0.

To perform this op, we first find the range of values in our tensor. The range
we use is always centered on 0, so we find m such that

1. m = max(abs(input_min), abs(input_max)) if range_given is true,
2. m = max(max(abs(min_elem(input)), abs(max_elem(input))) otherwise.

Our input tensor range is then [-m, m].

Next, we choose our fixed-point quantization buckets, [min_fixed, max_fixed].
If signed_input is true, this is

  [min_fixed, max_fixed ] =
      [-(1 << (num_bits - 1) - 1), (1 << (num_bits - 1)) - 1].

Otherwise, if signed_input is false, the fixed-point range is

  [min_fixed, max_fixed] = [0, (1 << num_bits) - 1].

From this we compute our scaling factor, s:

  s = (max_fixed - min_fixed) / (2 * m).

Now we can quantize and dequantize the elements of our tensor.  An element e
is transformed into e':

  e' = (e * s).round_to_nearest() / s.

Note that we have a different number of buckets in the signed vs. unsigned
cases.  For example, if num_bits == 8, we get 254 buckets in the signed case
vs. 255 in the unsigned case.

For example, suppose num_bits = 8 and m = 1.  Then

  [min_fixed, max_fixed] = [-127, 127], and
  s = (127 + 127) / 2 = 127.

Given the vector {-1, -0.5, 0, 0.3}, this is quantized to
{-127, -63, 0, 38}, and dequantized to {-1, -63.0/127, 0, 38.0/127}.
ģ
QuantizeDownAndShrinkRange
input"TinputQ
	input_minBThe float value that the minimum quantized input value represents.Q
	input_maxBThe float value that the maximum quantized input value represents.
output"out_typeS

output_minCThe float value that the minimum quantized output value represents.S

output_maxCThe float value that the maximum quantized output value represents."1
Tinputtype"The type of the input.:	
2"]
out_typetype"@The type of the output. Should be a lower bit depth than Tinput.:	
2*OConvert the quantized 'input' tensor into a lower-precision 'output', using the2õ
actual distribution of the values to maximize the usage of the lower bit depth
and adjusting the output min and max ranges accordingly.

[input_min, input_max] are scalar floats that specify the range for the float
interpretation of the 'input' data. For example, if input_min is -1.0f and
input_max is 1.0f, and we are dealing with quint16 quantized data, then a 0
value in the 16-bit data should be interpreted as -1.0f, and a 65535 means 1.0f.

This operator tries to squeeze as much precision as possible into an output with
a lower bit depth by calculating the actual min and max values found in the
data. For example, maybe that quint16 input has no values lower than 16,384 and
none higher than 49,152. That means only half the range is actually needed, all
the float interpretations are between -0.5f and 0.5f, so if we want to compress
the data into a quint8 output, we can use that range rather than the theoretical
-1.0f to 1.0f that is suggested by the input min and max.

In practice, this is most useful for taking output from operations like
QuantizedMatMul that can produce higher bit-depth outputs than their inputs and
may have large potential output ranges, but in practice have a distribution of
input values that only uses a small fraction of the possible range. By feeding
that output into this operator, we can reduce it from 32 bits down to 8 with
minimal loss of accuracy.
«

QuantizeV2	
inputH
	min_range9The minimum scalar value possibly produced for the input.H
	max_range9The maximum scalar value possibly produced for the input.>
output1The quantized data produced from the float input."TD

output_min4The actual minimum scalar value used for the output.D

output_max4The actual maximum scalar value used for the output."
Ttype:	
2";
modestringMIN_COMBINED:
MIN_COMBINED	MIN_FIRST*IQuantize the 'input' tensor of type float to 'output' tensor of type 'T'.2[min_range, max_range] are scalar floats that specify the range for
the 'input' data. The 'mode' attribute controls exactly which calculations are
used to convert the float values to their quantized equivalents.

In 'MIN_COMBINED' mode, each value of the tensor will undergo the following:

```
out[i] = (in[i] - min_range) * range(T) / (max_range - min_range)
if T == qint8, out[i] -= (range(T) + 1) / 2.0
```
here `range(T) = numeric_limits<T>::max() - numeric_limits<T>::min()`

*MIN_COMBINED Mode Example*

Assume the input is type float and has a possible range of [0.0, 6.0] and the
output type is quint8 ([0, 255]). The min_range and max_range values should be
specified as 0.0 and 6.0. Quantizing from float to quint8 will multiply each
value of the input by 255/6 and cast to quint8.

If the output type was qint8 ([-128, 127]), the operation will additionally
subtract each value by 128 prior to casting, so that the range of values aligns
with the range of qint8.

If the mode is 'MIN_FIRST', then this approach is used:

```
number_of_steps = 1 << (# of bits in T)
range_adjust = number_of_steps / (number_of_steps - 1)
range = (range_max - range_min) * range_adjust
range_scale = number_of_steps / range
quantized = round(input * range_scale) - round(range_min * range_scale) +
  numeric_limits<T>::min()
quantized = max(quantized, numeric_limits<T>::min())
quantized = min(quantized, numeric_limits<T>::max())
```

The biggest difference between this and MIN_COMBINED is that the minimum range
is rounded first, before it's subtracted from the rounded value. With
MIN_COMBINED, a small bias is introduced where repeated iterations of quantizing
and dequantizing will introduce a larger and larger error.

One thing to watch out for is that the operator may choose to adjust the
requested minimum and maximum values slightly during the quantization process,
so you should always use the output ports as the range for further calculations.
For example, if the requested minimum and maximum values are close to equal,
they will be separated by a small epsilon value to prevent ill-formed quantized
buffers from being created. Otherwise, you can end up with buffers where all the
quantized values map to the same float value, which causes problems for
operations that have to perform further calculations on them.

QuantizedAvgPool>
input24-D with shape `[batch, height, width, channels]`."TP
	min_inputAThe float value that the lowest quantized input value represents.Q
	max_inputBThe float value that the highest quantized input value represents.
output"TR

min_outputBThe float value that the lowest quantized output value represents.S

max_outputCThe float value that the highest quantized output value represents."
Ttype:	
2"
ksize	list(int)"The size of the window for each dimension of the input tensor.
The length must be 4 to match the number of dimensions of the input."„
strides	list(int)"The stride of the sliding window for each dimension of the input
tensor.  The length must be 4 to match the number of dimensions of the input."I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*BProduces the average pool of the input tensor for quantized types.

)QuantizedBatchNormWithGlobalNormalization
tA 4D input Tensor."Tinput?
t_min4The value represented by the lowest quantized input.@
t_max5The value represented by the highest quantized input.
mA 1D mean Tensor with size matching the last dimension of t.
This is the first output from tf.nn.moments,
or a saved moving average thereof."Tinput>
m_min3The value represented by the lowest quantized mean.?
m_max4The value represented by the highest quantized mean.
vA 1D variance Tensor with size matching the last dimension of t.
This is the second output from tf.nn.moments,
or a saved moving average thereof."TinputB
v_min7The value represented by the lowest quantized variance.C
v_max8The value represented by the highest quantized variance.|
betalA 1D beta Tensor with size matching the last dimension of t.
An offset to be added to the normalized tensor."TinputC
beta_min5The value represented by the lowest quantized offset.D
beta_max6The value represented by the highest quantized offset.²
gamma A 1D gamma Tensor with size matching the last dimension of t.
If "scale_after_normalization" is true, this tensor will be multiplied
with the normalized tensor."TinputC
	gamma_min4The value represented by the lowest quantized gamma.D
	gamma_max5The value represented by the highest quantized gamma.
result"out_type

result_min

result_max"
Tinputtype:	
2"
out_typetype:	
2"G
variance_epsilonfloat",A small float number to avoid dividing by 0."s
scale_after_normalizationbool"PA bool indicating whether the resulted tensor
needs to be multiplied with gamma.*Quantized Batch normalization.2\This op is deprecated and will be removed in the future. Prefer
`tf.nn.batch_normalization`.
²
QuantizedBiasAdd
input"T1N
biasBA 1D bias Tensor with size matching the last dimension of 'input'."T2P
	min_inputAThe float value that the lowest quantized input value represents.Q
	max_inputBThe float value that the highest quantized input value represents.N
min_bias@The float value that the lowest quantized bias value represents.O
max_biasAThe float value that the highest quantized bias value represents.
output"out_typeO
min_outBThe float value that the lowest quantized output value represents.P
max_outCThe float value that the highest quantized output value represents."
T1type:	
2"
T2type:	
2"
out_typetype:	
2*9Adds Tensor 'bias' to Tensor 'input' for Quantized types.2>Broadcasts the values of bias on dimensions 0..N-2 of 'input'.
ó
QuantizedConcath

concat_dimX0-D.  The dimension along which to concatenate.  Must be in the
range [0, rank(values)).
valuesThe `N` Tensors to concatenate. Their ranks and types must match,
and their sizes must match in all dimensions except `concat_dim`."T*NK

input_mins8The minimum scalar values for each of the input tensors.*NL
input_maxes8The maximum scalar values for each of the input tensors.*NĖ
output½A `Tensor` with the concatenation of values stacked along the
`concat_dim` dimension.  This tensor's shape matches that of `values` except
in `concat_dim` where it has the sum of the sizes."TS

output_minCThe float value that the minimum quantized output value represents.S

output_maxCThe float value that the maximum quantized output value represents."
Nint(0"	
Ttype*3Concatenates quantized tensors along one dimension.
õ	
QuantizedConv2D
input"TinputV
filterCfilter's input_depth dimension must match input's depth dimensions."TfilterP
	min_inputAThe float value that the lowest quantized input value represents.Q
	max_inputBThe float value that the highest quantized input value represents.R

min_filterBThe float value that the lowest quantized filter value represents.S

max_filterCThe float value that the highest quantized filter value represents.
output"out_typeR

min_outputBThe float value that the lowest quantized output value represents.S

max_outputCThe float value that the highest quantized output value represents."
Tinputtype:	
2"
Tfiltertype:	
2"
out_typetype0:	
2"^
strides	list(int)"HThe stride of the sliding window for each dimension of the input
tensor."I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*FComputes a 2D convolution given quantized 4D input and filter tensors.2¢The inputs are quantized tensors where the lowest value represents the real
number of the associated minimum, and the highest represents the maximum.
This means that you can only interpret the quantized output in the same way, by
taking the returned minimum and maximum values into account.
ó
QuantizedInstanceNorm
xA 4D input Tensor."T?
x_min4The value represented by the lowest quantized input.@
x_max5The value represented by the highest quantized input.
yA 4D Tensor."T@
y_min5The value represented by the lowest quantized output.A
y_max6The value represented by the highest quantized output."
Ttype:	
2"²
output_range_givenbool( "If True, `given_y_min` and `given_y_min`
and `given_y_max` are used as the output range. Otherwise,
the implementation computes the output range."O
given_y_minfloat%    "2Output in `y_min` if `output_range_given` is True."O
given_y_maxfloat%    "2Output in `y_max` if `output_range_given` is True."N
variance_epsilonfloat%¬Å'7",A small float number to avoid dividing by 0."@
min_separationfloat%o:" Minimum value of `y_max - y_min`*!Quantized Instance normalization.
Ķ	
QuantizedMatMul*
a!Must be a two-dimensional tensor."T1*
b!Must be a two-dimensional tensor."T2J
min_a?The float value that the lowest quantized `a` value represents.K
max_a@The float value that the highest quantized `a` value represents.J
min_b?The float value that the lowest quantized `b` value represents.K
max_b@The float value that the highest quantized `b` value represents.
out"ToutputO
min_outBThe float value that the lowest quantized output value represents.P
max_outCThe float value that the highest quantized output value represents."
T1type:	
2"
T2type:	
2"
Toutputtype0:	
2"J
transpose_abool( "1If true, `a` is transposed before multiplication."J
transpose_bbool( "1If true, `b` is transposed before multiplication."p
Tactivationtype0"LThe type of output produced by activation function
following this operation.:	
2*DPerform a quantized matrix multiplication of  `a` by the matrix `b`.2ŽThe inputs must be two-dimensional matrices and the inner dimension of
`a` (after being transposed if `transpose_a` is non-zero) must match the
outer dimension of `b` (after being transposed if `transposed_b` is
non-zero).

QuantizedMaxPoolJ
input>The 4D (batch x rows x cols x depth) Tensor to MaxReduce over."TP
	min_inputAThe float value that the lowest quantized input value represents.Q
	max_inputBThe float value that the highest quantized input value represents.
output"TR

min_outputBThe float value that the lowest quantized output value represents.S

max_outputCThe float value that the highest quantized output value represents."
Ttype:	
2"
ksize	list(int)"The size of the window for each dimension of the input tensor.
The length must be 4 to match the number of dimensions of the input."¤
strides	list(int)"The stride of the sliding window for each dimension of the input
tensor. The length must be 4 to match the number of dimensions of the input."I
paddingstring"%The type of padding algorithm to use.:
SAMEVALID*>Produces the max pool of the input tensor for quantized types.

QuantizedRelu
features"TinputM
min_features;The float value that the lowest quantized value represents.N
max_features<The float value that the highest quantized value represents.A
activations(Has the same output shape as "features"."out_typeP
min_activations;The float value that the lowest quantized value represents.Q
max_activations<The float value that the highest quantized value represents."
Tinputtype:	
2"
out_typetype0:	
2*7Computes Quantized Rectified Linear: `max(features, 0)`
Ŗ
QuantizedRelu6
features"TinputM
min_features;The float value that the lowest quantized value represents.N
max_features<The float value that the highest quantized value represents.A
activations(Has the same output shape as "features"."out_typeP
min_activations;The float value that the lowest quantized value represents.Q
max_activations<The float value that the highest quantized value represents."
Tinputtype:	
2"
out_typetype0:	
2*AComputes Quantized Rectified Linear 6: `min(max(features, 0), 6)`
Į
QuantizedReluX
features"Tinput
	max_valueM
min_features;The float value that the lowest quantized value represents.N
max_features<The float value that the highest quantized value represents.A
activations(Has the same output shape as "features"."out_typeP
min_activations;The float value that the lowest quantized value represents.Q
max_activations<The float value that the highest quantized value represents."
Tinputtype:	
2"
out_typetype0:	
2*IComputes Quantized Rectified Linear X: `min(max(features, 0), max_value)`

QuantizedReshape
tensor"T8
shape'Defines the shape of the output tensor."Tshape.
	input_minThe minimum value of the input..
	input_maxThe maximum value of the input.
output"T4

output_min$This value is copied from input_min.4

output_max$This value is copied from input_max."	
Ttype"
Tshapetype0:
2	*2Reshapes a quantized tensor as per the Reshape op.2```


QueueClose%
handleThe handle to a queue."
cancel_pending_enqueuesbool( "\If true, all pending enqueue requests that are
blocked on the given queue will be cancelled.*Closes the given queue.2µThis operation signals that no more elements will be enqueued in the
given queue. Subsequent Enqueue(Many) operations will fail.
Subsequent Dequeue(Many) operations will continue to succeed if
sufficient elements remain in the queue. Subsequent Dequeue(Many)
operations that would block will fail immediately.

QueueCloseV2"
handleThe handle to a queue."
cancel_pending_enqueuesbool( "\If true, all pending enqueue requests that are
blocked on the given queue will be cancelled.*Closes the given queue.2µThis operation signals that no more elements will be enqueued in the
given queue. Subsequent Enqueue(Many) operations will fail.
Subsequent Dequeue(Many) operations will continue to succeed if
sufficient elements remain in the queue. Subsequent Dequeue(Many)
operations that would block will fail immediately.
Ł
QueueDequeue%
handleThe handle to a queue.Q

components2One or more tensors that were dequeued as a tuple.2component_types"I
component_types
list(type)"&The type of each component in a tuple.(0"

timeout_msint’’’’’’’’’"{If the queue is empty, this operation will block for up to
timeout_ms milliseconds.
Note: This option is not supported yet.*=Dequeues a tuple of one or more tensors from the given queue.2¦This operation has k outputs, where k is the number of components
in the tuples stored in the given queue, and output i is the ith
component of the dequeued tuple.

N.B. If the queue is empty, this operation will block until an element
has been dequeued (or 'timeout_ms' elapses, if specified).
É
QueueDequeueMany%
handleThe handle to a queue.'
n The number of tuples to dequeue.Q

components2One or more tensors that were dequeued as a tuple.2component_types"I
component_types
list(type)"&The type of each component in a tuple.(0"­

timeout_msint’’’’’’’’’"If the queue has fewer than n elements, this operation
will block for up to timeout_ms milliseconds.
Note: This option is not supported yet.*>Dequeues n tuples of one or more tensors from the given queue.2ÖIf the queue is closed and there are fewer than n elements, then an
OutOfRange error is returned.

This operation concatenates queue-element component tensors along the
0th dimension to make a single component tensor.  All of the components
in the dequeued tuple will have size n in the 0th dimension.

This operation has k outputs, where k is the number of components in
the tuples stored in the given queue, and output i is the ith
component of the dequeued tuple.

N.B. If the queue is empty, this operation will block until n elements
have been dequeued (or 'timeout_ms' elapses, if specified).
Č
QueueDequeueManyV2"
handleThe handle to a queue.'
n The number of tuples to dequeue.Q

components2One or more tensors that were dequeued as a tuple.2component_types"I
component_types
list(type)"&The type of each component in a tuple.(0"­

timeout_msint’’’’’’’’’"If the queue has fewer than n elements, this operation
will block for up to timeout_ms milliseconds.
Note: This option is not supported yet.*>Dequeues n tuples of one or more tensors from the given queue.2ÖIf the queue is closed and there are fewer than n elements, then an
OutOfRange error is returned.

This operation concatenates queue-element component tensors along the
0th dimension to make a single component tensor.  All of the components
in the dequeued tuple will have size n in the 0th dimension.

This operation has k outputs, where k is the number of components in
the tuples stored in the given queue, and output i is the ith
component of the dequeued tuple.

N.B. If the queue is empty, this operation will block until n elements
have been dequeued (or 'timeout_ms' elapses, if specified).
ó

QueueDequeueUpTo%
handleThe handle to a queue.'
n The number of tuples to dequeue.Q

components2One or more tensors that were dequeued as a tuple.2component_types"I
component_types
list(type)"&The type of each component in a tuple.(0"­

timeout_msint’’’’’’’’’"If the queue has fewer than n elements, this operation
will block for up to timeout_ms milliseconds.
Note: This option is not supported yet.*>Dequeues n tuples of one or more tensors from the given queue.2This operation is not supported by all queues.  If a queue does not support
DequeueUpTo, then an Unimplemented error is returned.

If the queue is closed and there are more than 0 but less than n elements
remaining, then instead of returning an OutOfRange error like
QueueDequeueMany, less than `n` elements are returned immediately.  If the queue
is closed and there are 0 elements left in the queue, then an OutOfRange
error is returned just like in QueueDequeueMany.  Otherwise the behavior
is identical to QueueDequeueMany:

This operation concatenates queue-element component tensors along the
0th dimension to make a single component tensor.  All of the components
in the dequeued tuple will have size n in the 0th dimension.

This operation has k outputs, where k is the number of components in
the tuples stored in the given queue, and output i is the ith
component of the dequeued tuple.
ņ

QueueDequeueUpToV2"
handleThe handle to a queue.'
n The number of tuples to dequeue.Q

components2One or more tensors that were dequeued as a tuple.2component_types"I
component_types
list(type)"&The type of each component in a tuple.(0"­

timeout_msint’’’’’’’’’"If the queue has fewer than n elements, this operation
will block for up to timeout_ms milliseconds.
Note: This option is not supported yet.*>Dequeues n tuples of one or more tensors from the given queue.2This operation is not supported by all queues.  If a queue does not support
DequeueUpTo, then an Unimplemented error is returned.

If the queue is closed and there are more than 0 but less than n elements
remaining, then instead of returning an OutOfRange error like
QueueDequeueMany, less than `n` elements are returned immediately.  If the queue
is closed and there are 0 elements left in the queue, then an OutOfRange
error is returned just like in QueueDequeueMany.  Otherwise the behavior
is identical to QueueDequeueMany:

This operation concatenates queue-element component tensors along the
0th dimension to make a single component tensor.  All of the components
in the dequeued tuple will have size n in the 0th dimension.

This operation has k outputs, where k is the number of components in
the tuples stored in the given queue, and output i is the ith
component of the dequeued tuple.
Ų
QueueDequeueV2"
handleThe handle to a queue.Q

components2One or more tensors that were dequeued as a tuple.2component_types"I
component_types
list(type)"&The type of each component in a tuple.(0"

timeout_msint’’’’’’’’’"{If the queue is empty, this operation will block for up to
timeout_ms milliseconds.
Note: This option is not supported yet.*=Dequeues a tuple of one or more tensors from the given queue.2¦This operation has k outputs, where k is the number of components
in the tuples stored in the given queue, and output i is the ith
component of the dequeued tuple.

N.B. If the queue is empty, this operation will block until an element
has been dequeued (or 'timeout_ms' elapses, if specified).

QueueEnqueue%
handleThe handle to a queue._

componentsDOne or more tensors from which the enqueued tensors should be taken.2Tcomponents"
Tcomponents
list(type)(0"

timeout_msint’’’’’’’’’"zIf the queue is full, this operation will block for up to
timeout_ms milliseconds.
Note: This option is not supported yet.*;Enqueues a tuple of one or more tensors in the given queue.2õThe components input has k elements, which correspond to the components of
tuples stored in the given queue.

N.B. If the queue is full, this operation will block until the given
element has been enqueued (or 'timeout_ms' elapses, if specified).
Ķ
QueueEnqueueMany%
handleThe handle to a queue._

componentsDOne or more tensors from which the enqueued tensors should
be taken.2Tcomponents"
Tcomponents
list(type)(0"

timeout_msint’’’’’’’’’"~If the queue is too full, this operation will block for up
to timeout_ms milliseconds.
Note: This option is not supported yet.*GEnqueues zero or more tuples of one or more tensors in the given queue.2§This operation slices each component tensor along the 0th dimension to
make multiple queue elements. All of the tuple components must have the
same size in the 0th dimension.

The components input has k elements, which correspond to the components of
tuples stored in the given queue.

N.B. If the queue is full, this operation will block until the given
elements have been enqueued (or 'timeout_ms' elapses, if specified).
Ģ
QueueEnqueueManyV2"
handleThe handle to a queue._

componentsDOne or more tensors from which the enqueued tensors should
be taken.2Tcomponents"
Tcomponents
list(type)(0"

timeout_msint’’’’’’’’’"~If the queue is too full, this operation will block for up
to timeout_ms milliseconds.
Note: This option is not supported yet.*GEnqueues zero or more tuples of one or more tensors in the given queue.2§This operation slices each component tensor along the 0th dimension to
make multiple queue elements. All of the tuple components must have the
same size in the 0th dimension.

The components input has k elements, which correspond to the components of
tuples stored in the given queue.

N.B. If the queue is full, this operation will block until the given
elements have been enqueued (or 'timeout_ms' elapses, if specified).

QueueEnqueueV2"
handleThe handle to a queue._

componentsDOne or more tensors from which the enqueued tensors should be taken.2Tcomponents"
Tcomponents
list(type)(0"

timeout_msint’’’’’’’’’"zIf the queue is full, this operation will block for up to
timeout_ms milliseconds.
Note: This option is not supported yet.*;Enqueues a tuple of one or more tensors in the given queue.2õThe components input has k elements, which correspond to the components of
tuples stored in the given queue.

N.B. If the queue is full, this operation will block until the given
element has been enqueued (or 'timeout_ms' elapses, if specified).

	QueueSize%
handleThe handle to a queue.4
size*The number of elements in the given queue.*3Computes the number of elements in the given queue.

QueueSizeV2"
handleThe handle to a queue.4
size*The number of elements in the given queue.*3Computes the number of elements in the given queue.
×
RGBToHSVT
imagesG1-D or higher rank. RGB data to convert. Last dimension must be size 3."T'
output`images` converted to HSV."T"
Ttype0:
2*,Converts one or more images from RGB to HSV.2Outputs a tensor of the same shape as the `images` tensor, containing the HSV
value of the pixels. The output is only well defined if the value in `images`
are in `[0,1]`.

`output[..., 0]` contains hue, `output[..., 1]` contains saturation, and
`output[..., 2]` contains value. All HSV values are in `[0,1]`. A hue of 0
corresponds to pure red, hue 1/3 is pure green, and 2/3 is pure blue.
¾

RandomCrop5
image)3-D of shape `[height, width, channels]`."TC
size91-D of length 2 containing: `crop_height`, `crop_width`..	@
output33-D of shape `[crop_height, crop_width, channels].`"T"
Ttype:
	2	"„
seedint "If either seed or seed2 are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."9
seed2int "'An second seed to avoid seed collision.*Randomly crop `image`.2·`size` is a 1-D int64 tensor with 2 elements representing the crop height and
width.  The values must be non negative.

This Op picks a random location in `image` and crops a `height` by `width`
rectangle from that location.  The random location is picked so the cropped
area will fit inside the original image.B"Random crop is now pure Python
ų
RandomGamma
shape1-D integer tensor. Shape of independent samples to draw from each
distribution described by the shape parameters given in alpha."Sn
alphabA tensor in which each scalar is a "shape" parameter describing the
associated gamma distribution."TĢ
output¾A tensor with shape `shape + shape(alpha)`. Each slice
`[:, ..., :, i0, i1, ...iN]` contains the samples drawn for
`alpha[i0, i1, ...iN]`. The dtype of the output matches the dtype of alpha."T"©
seedint "If either `seed` or `seed2` are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."8
seed2int "&A second seed to avoid seed collision."
Stype:
2	"
Ttype:
2*HOutputs random values from the Gamma distribution(s) described by alpha.2¾This op uses the algorithm by Marsaglia et al. to acquire samples via
transformation-rejection from pairs of uniform and normal random variables.
See http://dl.acm.org/citation.cfm?id=358414
Š
RandomShuffle&
valueThe tensor to be shuffled."T\
outputOA tensor of same shape and type as `value`, shuffled along its first
dimension."T"©
seedint "If either `seed` or `seed2` are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."8
seed2int "&A second seed to avoid seed collision."	
Ttype*5Randomly shuffles a tensor along its first dimension.2  The tensor is shuffled along dimension 0, such that each `value[j]` is mapped
  to one and only one `output[i]`. For example, a mapping that might occur for a
  3x2 tensor is:

```prettyprint
[[1, 2],       [[5, 6],
 [3, 4],  ==>   [1, 2],
 [5, 6]]        [3, 4]]
```
Ł	
RandomShuffleQueue'
handleThe handle to the queue."I
component_types
list(type)"&The type of each component in a value.(0"
shapeslist(shape)
 "The shape of each component in a value. The length of this attr must
be either 0 or the same as the length of component_types. If the length of
this attr is 0, the shapes of queue elements are not constrained, and
only one element may be dequeued at a time.("v
capacityint’’’’’’’’’"XThe upper bound on the number of elements in this queue.
Negative numbers mean no limit."ø
min_after_dequeueint "Dequeue will block unless there would be this
many elements after the dequeue or the queue is closed. This
ensures a minimum level of mixing of elements."
seedint "If either seed or seed2 is set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, a random seed is used."8
seed2int "&A second seed to avoid seed collision."{
	containerstring "bIf non-empty, this queue is placed in the given container.
Otherwise, a default container is used."q
shared_namestring "VIf non-empty, this queue will be shared under the given name
across multiple sessions.*.A queue that randomizes the order of elements.
Ų	
RandomShuffleQueueV2$
handleThe handle to the queue."I
component_types
list(type)"&The type of each component in a value.(0"
shapeslist(shape)
 "The shape of each component in a value. The length of this attr must
be either 0 or the same as the length of component_types. If the length of
this attr is 0, the shapes of queue elements are not constrained, and
only one element may be dequeued at a time.("v
capacityint’’’’’’’’’"XThe upper bound on the number of elements in this queue.
Negative numbers mean no limit."ø
min_after_dequeueint "Dequeue will block unless there would be this
many elements after the dequeue or the queue is closed. This
ensures a minimum level of mixing of elements."
seedint "If either seed or seed2 is set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, a random seed is used."8
seed2int "&A second seed to avoid seed collision."{
	containerstring "bIf non-empty, this queue is placed in the given container.
Otherwise, a default container is used."q
shared_namestring "VIf non-empty, this queue will be shared under the given name
across multiple sessions.*.A queue that randomizes the order of elements.
ø
RandomStandardNormal+
shapeThe shape of the output tensor."TR
outputAA tensor of the specified shape filled with random normal values."dtype"©
seedint "If either `seed` or `seed2` are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."8
seed2int "&A second seed to avoid seed collision."/
dtypetype"The type of the output.:
2"
Ttype:
2	*1Outputs random values from a normal distribution.2?The generated values will have mean 0 and standard deviation 1.

RandomUniform+
shapeThe shape of the output tensor."TS
outputBA tensor of the specified shape filled with uniform random values."dtype"©
seedint "If either `seed` or `seed2` are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."8
seed2int "&A second seed to avoid seed collision."/
dtypetype"The type of the output.:
2"
Ttype:
2	*2Outputs random values from a uniform distribution.2The generated values follow a uniform distribution in the range `[0, 1)`. The
lower bound 0 is included in the range, while the upper bound 1 is excluded.
ö
RandomUniformInt+
shapeThe shape of the output tensor."TF
minval60-D.  Inclusive lower bound on the generated integers."ToutF
maxval60-D.  Exclusive upper bound on the generated integers."ToutT
outputDA tensor of the specified shape filled with uniform random integers."Tout"©
seedint "If either `seed` or `seed2` are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."8
seed2int "&A second seed to avoid seed collision."
Touttype:
2	"
Ttype:
2	*4Outputs random integers from a uniform distribution.2The generated values are uniform integers in the range `[minval, maxval)`.
The lower bound `minval` is included in the range, while the upper bound
`maxval` is excluded.

The random integers are slightly biased unless `maxval - minval` is an exact
power of two.  The bias is small for values of `maxval - minval` significantly
smaller than the range of the output (either `2^32` or `2^64`).
±
Range9
start*0-D (scalar). First entry in the sequence."Tidx@
limit10-D (scalar). Upper limit of sequence, exclusive."TidxT
deltaE0-D (scalar). Optional. Default is 1. Number that increments `start`."Tidx
output1-D."Tidx"
Tidxtype0:
2	*Creates a sequence of numbers.2This operation creates a sequence of numbers that begins at `start` and
extends by increments of `delta` up to but not including `limit`.

For example:

```
# 'start' is 3
# 'limit' is 18
# 'delta' is 3
tf.range(start, limit, delta) ==> [3, 6, 9, 12, 15]
```
’
Rank

input"T

output"	
Ttype*Returns the rank of a tensor.2“This operation returns an integer representing the rank of `input`.

For example:

```prettyprint
# 't' is [[[1, 1, 1], [2, 2, 2]], [[3, 3, 3], [4, 4, 4]]]
# shape of tensor 't' is [2, 2, 3]
rank(t) ==> 3
```

**Note**: The rank of a tensor is not the same as the rank of a matrix. The rank
of a tensor is the number of indices required to uniquely select each element
of the tensor. Rank is also known as "order", "degree", or "ndims."
d
ReadFile
filename
contents*<Reads and outputs the entire contents of the input filename.
ā
ReaderNumRecordsProduced)
reader_handleHandle to a Reader.
records_produced	*7Returns the number of records this Reader has produced.2LThis is the same as the number of ReaderRead executions that have
succeeded.
į
ReaderNumRecordsProducedV2&
reader_handleHandle to a Reader.
records_produced	*7Returns the number of records this Reader has produced.2LThis is the same as the number of ReaderRead executions that have
succeeded.
¤
ReaderNumWorkUnitsCompleted)
reader_handleHandle to a Reader.
units_completed	*EReturns the number of work units this Reader has finished processing.
£
ReaderNumWorkUnitsCompletedV2&
reader_handleHandle to a Reader.
units_completed	*EReturns the number of work units this Reader has finished processing.


ReaderRead)
reader_handleHandle to a Reader.?
queue_handle*Handle to a Queue, with string work items.
key	A scalar.
value	A scalar.*?Returns the next record (key, value pair) produced by a Reader.2Will dequeue from the input queue if necessary (e.g. when the
Reader needs to start reading from a new file since it has finished
with the previous file).

ReaderReadUpTo+
reader_handleHandle to a `Reader`.A
queue_handle,Handle to a `Queue`, with string work items.9
num_records(number of records to read from `Reader`.	
keysA 1-D tensor.
valuesA 1-D tensor.*DReturns up to `num_records` (key, value) pairs produced by a Reader.2ÜWill dequeue from the input queue if necessary (e.g. when the
Reader needs to start reading from a new file since it has finished
with the previous file).
It may return less than `num_records` even before the last batch.

ReaderReadUpToV2(
reader_handleHandle to a `Reader`.>
queue_handle,Handle to a `Queue`, with string work items.9
num_records(number of records to read from `Reader`.	
keysA 1-D tensor.
valuesA 1-D tensor.*DReturns up to `num_records` (key, value) pairs produced by a Reader.2ÜWill dequeue from the input queue if necessary (e.g. when the
Reader needs to start reading from a new file since it has finished
with the previous file).
It may return less than `num_records` even before the last batch.
ü
ReaderReadV2&
reader_handleHandle to a Reader.<
queue_handle*Handle to a Queue, with string work items.
key	A scalar.
value	A scalar.*?Returns the next record (key, value pair) produced by a Reader.2Will dequeue from the input queue if necessary (e.g. when the
Reader needs to start reading from a new file since it has finished
with the previous file).
f
ReaderReset)
reader_handleHandle to a Reader.*,Restore a Reader to its initial clean state.
e
ReaderResetV2&
reader_handleHandle to a Reader.*,Restore a Reader to its initial clean state.

ReaderRestoreState)
reader_handleHandle to a Reader.Y
stateNResult of a ReaderSerializeState of a Reader with type
matching reader_handle.*-Restore a reader to a previously saved state.2SNot all Readers support being restored, so this can produce an
Unimplemented error.

ReaderRestoreStateV2&
reader_handleHandle to a Reader.Y
stateNResult of a ReaderSerializeState of a Reader with type
matching reader_handle.*-Restore a reader to a previously saved state.2SNot all Readers support being restored, so this can produce an
Unimplemented error.
ą
ReaderSerializeState)
reader_handleHandle to a Reader.	
state*;Produce a string tensor that encodes the state of a Reader.2UNot all Readers support being serialized, so this can produce an
Unimplemented error.
ß
ReaderSerializeStateV2&
reader_handleHandle to a Reader.	
state*;Produce a string tensor that encodes the state of a Reader.2UNot all Readers support being serialized, so this can produce an
Unimplemented error.

Real

input"T
output"Tout"
Ttype0:
2"
Touttype0:
2**Returns the real part of a complex number.2Given a tensor `input` of complex numbers, this operation returns a tensor of
type `float` that is the real part of each element in `input`. All elements in
`input` must be complex numbers of the form \\(a + bj\\), where *a* is the real
 part returned by this operation and *b* is the imaginary part.

For example:

```
# tensor 'input' is [-2.25 + 4.75j, 3.25 + 5.75j]
tf.real(input) ==> [-2.25, 3.25]
```
·
RealDiv
x"T
y"T
z"T"
Ttype:
2	**Returns x / y element-wise for real types.2ĖIf `x` and `y` are reals, this will return the floating-point division.

*NOTE*: `Div` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)
x

Reciprocal
x"T
y"T"
Ttype:
	2	**Computes the reciprocal of x element-wise.2I.e., \\(y = 1 / x\\).
Ż
ReciprocalGrad
x"T
y"T
z"T"
Ttype:	
2*;Computes the gradient for the inverse of `x` wrt its input.2`Specifically, `grad = -dy * y*y`, where `y = 1/x`, and `dy`
is the corresponding input gradient.
Ų

ReduceJoinQ
inputsEThe input to be joined.  All reduced indices must have non-zero size.ę
reduction_indicesĪThe dimensions to reduce over.  Dimensions are reduced in the
order specified.  Omitting `reduction_indices` is equivalent to passing
`[n-1, n-2, ..., 0]`.  Negative indices from `-n` to `-1` are supported.x
outputlHas shape equal to that of the input with reduced dimensions removed or
set to `1` depending on `keep_dims`."L
	keep_dimsbool( "5If `True`, retain reduced dimensions with length `1`.";
	separatorstring ""The separator to use when joining.*2Joins a string Tensor across the given dimensions.2ŌComputes the string join across dimensions in the given string Tensor of shape
`[d_0, d_1, ..., d_n-1]`.  Returns a new Tensor created by joining the input
strings with the given separator (default: empty string).  Negative indices are
counted backwards from the end, with `-1` being equivalent to `n - 1`.

For example:

```
# tensor `a` is [["a", "b"], ["c", "d"]]
tf.reduce_join(a, 0) ==> ["ac", "bd"]
tf.reduce_join(a, 1) ==> ["ab", "cd"]
tf.reduce_join(a, -2) = tf.reduce_join(a, 0) ==> ["ac", "bd"]
tf.reduce_join(a, -1) = tf.reduce_join(a, 1) ==> ["ab", "cd"]
tf.reduce_join(a, 0, keep_dims=True) ==> [["ac", "bd"]]
tf.reduce_join(a, 1, keep_dims=True) ==> [["ab"], ["cd"]]
tf.reduce_join(a, 0, separator=".") ==> ["a.c", "b.d"]
tf.reduce_join(a, [0, 1]) ==> ["acbd"]
tf.reduce_join(a, [1, 0]) ==> ["abcd"]
tf.reduce_join(a, []) ==> ["abcd"]
```
¾
RefEnterA
data3The tensor to be made available to the child frame."T*
outputThe same tensor as `data`."T"	
Ttype"2

frame_namestring"The name of the child frame."P
is_constantbool( "7If true, the output is constant within the child frame."T
parallel_iterationsint
"4The number of iterations allowed to run in parallel.*NCreates or finds a child frame, and makes `data` available to the child frame.2The unique `frame_name` is used by the `Executor` to identify frames. If
`is_constant` is true, `output` is a constant in the child frame; otherwise
it may be changed in the child frame. At most `parallel_iterations` iterations
are run in parallel in the child frame.
ī
RefExitB
data4The tensor to be made available to the parent frame."T*
outputThe same tensor as `data`."T"	
Ttype*,Exits the current frame to its parent frame.2:Exit makes its input `data` available to the parent frame.
o
RefIdentity
input"T
output"T"	
Ttype*3Return the same ref tensor as the input ref tensor.
Ą
RefMergeQ
inputs>The input tensors, exactly one of which will become available."T*N:
output*Will be set to the available input tensor."TB
value_index1The index of the chosen input tensor in `inputs`."	
Ttype"
Nint(0*DForwards the value of an available tensor from `inputs` to `output`.2`Merge` waits for at least one of the tensors in `inputs` to become available.
It is usually combined with `Switch` to implement branching.

`Merge` forwards the first tensor for become available to `output`, and sets
`value_index` to its index in `inputs`.
Į
RefNextIterationD
data6The tensor to be made available to the next iteration."T*
outputThe same tensor as `data`."T"	
Ttype*0Makes its input available to the next iteration.

	RefSelectA
index6A scalar that determines the input that gets selected.U
inputsBA list of ref tensors, one of which will be forwarded to `output`."T*N%
outputThe forwarded tensor."T"	
Ttype"
Nint(0*7Forwards the `index`th element of `inputs` to `output`.
¦
	RefSwitchG
data9The ref tensor to be forwarded to the appropriate output."TF
pred<A scalar that specifies which output port will receive data.
P
output_false:If `pred` is false, data will be forwarded to this output."TN
output_true9If `pred` is true, data will be forwarded to this output."T"	
Ttype*GForwards the ref tensor `data` to the output port determined by `pred`.2If `pred` is true, the `data` input is forwarded to `output_true`. Otherwise,
the data goes to `output_false`.

See also `Switch` and `Merge`.
q
Relu
features"T
activations"T"
Ttype:
2		*.Computes rectified linear: `max(features, 0)`.
|
Relu6
features"T
activations"T"
Ttype:
2		*8Computes rectified linear 6: `min(max(features, 0), 6)`.
Ł
	Relu6GradR
	gradientsBThe backpropagated gradients to the corresponding Relu6 operation."TQ
featuresBThe features passed as input to the corresponding Relu6 operation."TM
	backprops=The gradients:
`gradients * (features > 0) * (features < 6)`."T"
Ttype:
2		*<Computes rectified linear 6 gradients for a Relu6 operation.
ļ
ReluGradQ
	gradientsAThe backpropagated gradients to the corresponding Relu operation."T
features|The features passed as input to the corresponding Relu operation, OR
the outputs of that operation (both work equivalently)."T-
	backprops`gradients * (features > 0)`."T"
Ttype:
2		*9Computes rectified linear gradients for a Relu operation.
É
RequantizationRange
input"TinputQ
	input_minBThe float value that the minimum quantized input value represents.Q
	input_maxBThe float value that the maximum quantized input value represents.(

output_minThe computed min output.(

output_maxthe computed max output."1
Tinputtype"The type of the input.:	
2*NGiven a quantized tensor described by (input, input_min, input_max), outputs a2£range that covers the actual values present in that tensor.  This op is
typically used to produce the requested_output_min and requested_output_max for
Requantize.
	

Requantize
input"TinputQ
	input_minBThe float value that the minimum quantized input value represents.Q
	input_maxBThe float value that the maximum quantized input value represents.]
requested_output_minCThe float value that the minimum quantized output value represents.]
requested_output_maxCThe float value that the maximum quantized output value represents.
output"out_typeJ

output_min:The requested_output_min value is copied into this output.J

output_max:The requested_output_max value is copied into this output."1
Tinputtype"The type of the input.:	
2"]
out_typetype"@The type of the output. Should be a lower bit depth than Tinput.:	
2*OConvert the quantized 'input' tensor into a lower-precision 'output', using the2output range specified with 'requested_output_min' and 'requested_output_max'.

[input_min, input_max] are scalar floats that specify the range for the float
interpretation of the 'input' data. For example, if input_min is -1.0f and
input_max is 1.0f, and we are dealing with quint16 quantized data, then a 0
value in the 16-bit data should be interpreted as -1.0f, and a 65535 means 1.0f.
­
Reshape
tensor"T8
shape'Defines the shape of the output tensor."Tshape
output"T"	
Ttype"
Tshapetype0:
2	*Reshapes a tensor.2Given `tensor`, this operation returns a tensor that has the same values
as `tensor` with shape `shape`.

If one component of `shape` is the special value -1, the size of that dimension
is computed so that the total size remains constant.  In particular, a `shape`
of `[-1]` flattens into 1-D.  At most one component of `shape` can be -1.

If `shape` is 1-D or higher, then the operation returns a tensor with shape
`shape` filled with the values of `tensor`. In this case, the number of elements
implied by `shape` must be the same as the number of elements in `tensor`.

For example:

```prettyprint
# tensor 't' is [1, 2, 3, 4, 5, 6, 7, 8, 9]
# tensor 't' has shape [9]
reshape(t, [3, 3]) ==> [[1, 2, 3],
                        [4, 5, 6],
                        [7, 8, 9]]

# tensor 't' is [[[1, 1], [2, 2]],
#                [[3, 3], [4, 4]]]
# tensor 't' has shape [2, 2, 2]
reshape(t, [2, 4]) ==> [[1, 1, 2, 2],
                        [3, 3, 4, 4]]

# tensor 't' is [[[1, 1, 1],
#                 [2, 2, 2]],
#                [[3, 3, 3],
#                 [4, 4, 4]],
#                [[5, 5, 5],
#                 [6, 6, 6]]]
# tensor 't' has shape [3, 2, 3]
# pass '[-1]' to flatten 't'
reshape(t, [-1]) ==> [1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6]

# -1 can also be used to infer the shape

# -1 is inferred to be 9:
reshape(t, [2, -1]) ==> [[1, 1, 1, 2, 2, 2, 3, 3, 3],
                         [4, 4, 4, 5, 5, 5, 6, 6, 6]]
# -1 is inferred to be 2:
reshape(t, [-1, 9]) ==> [[1, 1, 1, 2, 2, 2, 3, 3, 3],
                         [4, 4, 4, 5, 5, 5, 6, 6, 6]]
# -1 is inferred to be 3:
reshape(t, [ 2, -1, 3]) ==> [[[1, 1, 1],
                              [2, 2, 2],
                              [3, 3, 3]],
                             [[4, 4, 4],
                              [5, 5, 5],
                              [6, 6, 6]]]

# tensor 't' is [7]
# shape `[]` reshapes to a scalar
reshape(t, []) ==> 7
```


ResizeArea?
images24-D with shape `[batch, height, width, channels]`."Td
sizeZ= A 1-D int32 Tensor of 2 elements: `new_height, new_width`.  The
new size for the images.N
resized_images:4-D with shape
`[batch, new_height, new_width, channels]`."
Ttype:

2	"ę
align_cornersbool( "ŹIf true, rescale input by (new_height - 1) / (height - 1), which
exactly aligns the 4 corners of images and resized images. If false, rescale
by new_height / height. Treat similarly the width dimension.*3Resize `images` to `size` using area interpolation.2JInput images can be of different types but output images are always float.

ResizeBicubic?
images24-D with shape `[batch, height, width, channels]`."Td
sizeZ= A 1-D int32 Tensor of 2 elements: `new_height, new_width`.  The
new size for the images.N
resized_images:4-D with shape
`[batch, new_height, new_width, channels]`."
Ttype:

2	"ę
align_cornersbool( "ŹIf true, rescale input by (new_height - 1) / (height - 1), which
exactly aligns the 4 corners of images and resized images. If false, rescale
by new_height / height. Treat similarly the width dimension.*6Resize `images` to `size` using bicubic interpolation.2JInput images can be of different types but output images are always float.

ResizeBilinear?
images24-D with shape `[batch, height, width, channels]`."Td
sizeZ= A 1-D int32 Tensor of 2 elements: `new_height, new_width`.  The
new size for the images.N
resized_images:4-D with shape
`[batch, new_height, new_width, channels]`."
Ttype:

2	"ę
align_cornersbool( "ŹIf true, rescale input by (new_height - 1) / (height - 1), which
exactly aligns the 4 corners of images and resized images. If false, rescale
by new_height / height. Treat similarly the width dimension.*7Resize `images` to `size` using bilinear interpolation.2JInput images can be of different types but output images are always float.

ResizeBilinearGrad=
grads24-D with shape `[batch, height, width, channels]`.t
original_image_4-D with shape `[batch, orig_height, orig_width, channels]`,
The image tensor that was resized."T”
output4-D with shape `[batch, orig_height, orig_width, channels]`.
Gradients with respect to the input image. Input image must have been
float or double."T"
Ttype:
2"ē
align_cornersbool( "ĖIf true, rescale grads by (orig_height - 1) / (height - 1), which
exactly aligns the 4 corners of grads and original_image. If false, rescale by
orig_height / height. Treat similarly the width dimension.*0Computes the gradient of bilinear interpolation.
Ņ
ResizeNearestNeighbor?
images24-D with shape `[batch, height, width, channels]`."Td
sizeZ= A 1-D int32 Tensor of 2 elements: `new_height, new_width`.  The
new size for the images.O
resized_images:4-D with shape
`[batch, new_height, new_width, channels]`."T"
Ttype:

2	"ę
align_cornersbool( "ŹIf true, rescale input by (new_height - 1) / (height - 1), which
exactly aligns the 4 corners of images and resized images. If false, rescale
by new_height / height. Treat similarly the width dimension.*?Resize `images` to `size` using nearest neighbor interpolation.
ļ
ResizeNearestNeighborGrad>
grads24-D with shape `[batch, height, width, channels]`."Ta
sizeW= A 1-D int32 Tensor of 2 elements: `orig_height, orig_width`. The
original input size.t
outputg4-D with shape `[batch, orig_height, orig_width, channels]`. Gradients
with respect to the input image."T"
Ttype:

2"ē
align_cornersbool( "ĖIf true, rescale grads by (orig_height - 1) / (height - 1), which
exactly aligns the 4 corners of grads and original_image. If false, rescale by
orig_height / height. Treat similarly the width dimension.*8Computes the gradient of nearest neighbor interpolation.
 
ResourceApplyAdadelta%
varShould be from a Variable().'
accumShould be from a Variable()..
accum_updateShould be from a Variable().*
lr!Scaling factor. Must be a scalar."T)
rhoDecay factor. Must be a scalar."T0
epsilon"Constant factor. Must be a scalar."T
gradThe gradient."T"
Ttype:
2	"¹
use_lockingbool( "If True, updating of the var, accum and update_accum tensors will be protected by
a lock; otherwise the behavior is undefined, but may exhibit less contention.*/Update '*var' according to the adadelta scheme.2×accum = rho() * accum + (1 - rho()) * grad.square();
update = (update_accum + epsilon).sqrt() * (accum + epsilon()).rsqrt() * grad;
update_accum = rho() * update_accum + (1 - rho()) * update.square();
var -= update;
ę
ResourceApplyAdagrad%
varShould be from a Variable().'
accumShould be from a Variable().*
lr!Scaling factor. Must be a scalar."T
gradThe gradient."T"
Ttype:
2	"­
use_lockingbool( "If `True`, updating of the var and accum tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*.Update '*var' according to the adagrad scheme.29accum += grad * grad
var -= lr * grad * (1 / sqrt(accum))

ResourceApplyAdagradDA%
varShould be from a Variable().6
gradient_accumulatorShould be from a Variable().>
gradient_squared_accumulatorShould be from a Variable().
gradThe gradient."T*
lr!Scaling factor. Must be a scalar."T-
l1$L1 regularization. Must be a scalar."T-
l2$L2 regularization. Must be a scalar."T8
global_step'Training step number. Must be a scalar.	"
Ttype:
2	"«
use_lockingbool( "If True, updating of the var and accum tensors will be protected by
a lock; otherwise the behavior is undefined, but may exhibit less contention.*7Update '*var' according to the proximal adagrad scheme.
ņ
ResourceApplyAdam%
varShould be from a Variable().#
mShould be from a Variable().#
vShould be from a Variable().#
beta1_powerMust be a scalar."T#
beta2_powerMust be a scalar."T*
lr!Scaling factor. Must be a scalar."T.
beta1"Momentum factor. Must be a scalar."T.
beta2"Momentum factor. Must be a scalar."T+
epsilonRidge term. Must be a scalar."T
gradThe gradient."T"
Ttype:
2	"­
use_lockingbool( "If `True`, updating of the var, m, and v tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*.Update '*var' according to the Adam algorithm.2Ļlr_t <- learning_rate * sqrt(1 - beta2^t) / (1 - beta1^t)
m_t <- beta1 * m_{t-1} + (1 - beta1) * g_t
v_t <- beta2 * v_{t-1} + (1 - beta2) * g_t * g_t
variable <- variable - lr_t * m_t / (sqrt(v_t) + epsilon)
ā
ResourceApplyCenteredRMSProp%
varShould be from a Variable().$
mgShould be from a Variable().$
msShould be from a Variable().%
momShould be from a Variable().*
lr!Scaling factor. Must be a scalar."T'
rhoDecay rate. Must be a scalar."T
momentum"T+
epsilonRidge term. Must be a scalar."T
gradThe gradient."T"
Ttype:
2	"Æ
use_lockingbool( "If `True`, updating of the var, mg, ms, and mom tensors is
protected by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*:Update '*var' according to the centered RMSProp algorithm.2ļThe centered RMSProp algorithm uses an estimate of the centered second moment
(i.e., the variance) for normalization, as opposed to regular RMSProp, which
uses the (uncentered) second moment. This often helps with training, but is
slightly more expensive in terms of computation and memory.

Note that in dense implementation of this algorithm, mg, ms, and mom will
update even if the grad is zero, but in this sparse implementation, mg, ms,
and mom will not update in iterations during which the grad is zero.

mean_square = decay * mean_square + (1-decay) * gradient ** 2
mean_grad = decay * mean_grad + (1-decay) * gradient

Delta = learning_rate * gradient / sqrt(mean_square + epsilon - mean_grad ** 2)

mg <- rho * mg_{t-1} + (1-rho) * grad
ms <- rho * ms_{t-1} + (1-rho) * grad * grad
mom <- momentum * mom_{t-1} + lr * grad / sqrt(ms - mg * mg + epsilon)
var <- var - mom
ā
ResourceApplyFtrl%
varShould be from a Variable().'
accumShould be from a Variable().(
linearShould be from a Variable().
gradThe gradient."T*
lr!Scaling factor. Must be a scalar."T,
l1#L1 regulariation. Must be a scalar."T,
l2#L2 regulariation. Must be a scalar."T0
lr_power!Scaling factor. Must be a scalar."T"
Ttype:
2	"­
use_lockingbool( "If `True`, updating of the var and accum tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*4Update '*var' according to the Ftrl-proximal scheme.2łaccum_new = accum + grad * grad
linear += grad + (accum_new^(-lr_power) - accum^(-lr_power)) / lr * var
quadratic = 1.0 / (accum_new^(lr_power) * lr) + 2 * l2
var = (sign(linear) * l1 - linear) / quadratic if |linear| > l1 else 0.0
accum = accum_new
ž
ResourceApplyGradientDescent%
varShould be from a Variable().-
alpha!Scaling factor. Must be a scalar."T
deltaThe change."T"
Ttype:
2	"
use_lockingbool( "}If `True`, the subtraction will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*7Update '*var' by subtracting 'alpha' * 'delta' from it.

ResourceApplyMomentum%
varShould be from a Variable().'
accumShould be from a Variable().*
lr!Scaling factor. Must be a scalar."T
gradThe gradient."T*
momentumMomentum. Must be a scalar."T"
Ttype:
2	"­
use_lockingbool( "If `True`, updating of the var and accum tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention."“
use_nesterovbool( "If `True`, the tensor passed to compute grad will be
var - lr * momentum * accum, so in the end, the var you get is actually
var - lr * momentum * accum.*NUpdate '*var' according to the momentum scheme. Set use_nesterov = True if you2Qwant to use Nesterov momentum.

accum = accum * momentum + grad
var -= lr * accum
¢
ResourceApplyProximalAdagrad%
varShould be from a Variable().'
accumShould be from a Variable().*
lr!Scaling factor. Must be a scalar."T-
l1$L1 regularization. Must be a scalar."T-
l2$L2 regularization. Must be a scalar."T
gradThe gradient."T"
Ttype:
2	"«
use_lockingbool( "If True, updating of the var and accum tensors will be protected by
a lock; otherwise the behavior is undefined, but may exhibit less contention.*IUpdate '*var' and '*accum' according to FOBOS with Adagrad learning rate.2vaccum += grad * grad
prox_v = var - lr * grad * (1 / sqrt(accum))
var = sign(prox_v)/(1+lr*l2) * max{|prox_v|-lr*l1,0}
¾
$ResourceApplyProximalGradientDescent%
varShould be from a Variable().-
alpha!Scaling factor. Must be a scalar."T-
l1$L1 regularization. Must be a scalar."T-
l2$L2 regularization. Must be a scalar."T
deltaThe change."T"
Ttype:
2	"
use_lockingbool( "{If True, the subtraction will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*:Update '*var' as FOBOS algorithm with fixed learning rate.2Wprox_v = var - alpha * delta
var = sign(prox_v)/(1+alpha*l2) * max{|prox_v|-alpha*l1,0}

ResourceApplyRMSProp%
varShould be from a Variable().$
msShould be from a Variable().%
momShould be from a Variable().*
lr!Scaling factor. Must be a scalar."T'
rhoDecay rate. Must be a scalar."T
momentum"T+
epsilonRidge term. Must be a scalar."T
gradThe gradient."T"
Ttype:
2	"«
use_lockingbool( "If `True`, updating of the var, ms, and mom tensors is protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*1Update '*var' according to the RMSProp algorithm.2ŹNote that in dense implementation of this algorithm, ms and mom will
update even if the grad is zero, but in this sparse implementation, ms
and mom will not update in iterations during which the grad is zero.

mean_square = decay * mean_square + (1-decay) * gradient ** 2
Delta = learning_rate * gradient / sqrt(mean_square + epsilon)

ms <- rho * ms_{t-1} + (1-rho) * grad * grad
mom <- momentum * mom_{t-1} + lr * grad / sqrt(ms + epsilon)
var <- var - mom

ResourceSparseApplyAdadelta
var'
accumShould be from a Variable().0
accum_update: Should be from a Variable().)
lr Learning rate. Must be a scalar."T)
rhoDecay factor. Must be a scalar."T0
epsilon"Constant factor. Must be a scalar."T
gradThe gradient."TS
indices>A vector of indices into the first dimension of var and accum."Tindices"
Ttype:
2	"
Tindicestype:
2	"«
use_lockingbool( "If True, updating of the var and accum tensors will be protected by
a lock; otherwise the behavior is undefined, but may exhibit less contention.*!var: Should be from a Variable().
Ć
ResourceSparseApplyAdagrad%
varShould be from a Variable().'
accumShould be from a Variable().)
lr Learning rate. Must be a scalar."T
gradThe gradient."TS
indices>A vector of indices into the first dimension of var and accum."Tindices"
Ttype:
2	"
Tindicestype:
2	"­
use_lockingbool( "If `True`, updating of the var and accum tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*OUpdate relevant entries in '*var' and '*accum' according to the adagrad scheme.2That is for rows we have grad for, we update var and accum as follows:
accum += grad * grad
var -= lr * grad * (1 / sqrt(accum))
§
ResourceSparseApplyAdagradDA%
varShould be from a Variable().6
gradient_accumulatorShould be from a Variable().>
gradient_squared_accumulatorShould be from a Variable().
gradThe gradient."TS
indices>A vector of indices into the first dimension of var and accum."Tindices)
lr Learning rate. Must be a scalar."T-
l1$L1 regularization. Must be a scalar."T-
l2$L2 regularization. Must be a scalar."T8
global_step'Training step number. Must be a scalar.	"
Ttype:
2	"
Tindicestype:
2	"«
use_lockingbool( "If True, updating of the var and accum tensors will be protected by
a lock; otherwise the behavior is undefined, but may exhibit less contention.*OUpdate entries in '*var' and '*accum' according to the proximal adagrad scheme.
Ø
"ResourceSparseApplyCenteredRMSProp%
varShould be from a Variable().$
mgShould be from a Variable().$
msShould be from a Variable().%
momShould be from a Variable().*
lr!Scaling factor. Must be a scalar."T'
rhoDecay rate. Must be a scalar."T
momentum"T+
epsilonRidge term. Must be a scalar."T
gradThe gradient."TU
indices@A vector of indices into the first dimension of var, ms and mom."Tindices"
Ttype:
2	"
Tindicestype:
2	"Æ
use_lockingbool( "If `True`, updating of the var, mg, ms, and mom tensors is
protected by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*:Update '*var' according to the centered RMSProp algorithm.2¾The centered RMSProp algorithm uses an estimate of the centered second moment
(i.e., the variance) for normalization, as opposed to regular RMSProp, which
uses the (uncentered) second moment. This often helps with training, but is
slightly more expensive in terms of computation and memory.

Note that in dense implementation of this algorithm, mg, ms, and mom will
update even if the grad is zero, but in this sparse implementation, mg, ms,
and mom will not update in iterations during which the grad is zero.

mean_square = decay * mean_square + (1-decay) * gradient ** 2
mean_grad = decay * mean_grad + (1-decay) * gradient
Delta = learning_rate * gradient / sqrt(mean_square + epsilon - mean_grad ** 2)

ms <- rho * ms_{t-1} + (1-rho) * grad * grad
mom <- momentum * mom_{t-1} + lr * grad / sqrt(ms + epsilon)
var <- var - mom
¼
ResourceSparseApplyFtrl%
varShould be from a Variable().'
accumShould be from a Variable().(
linearShould be from a Variable().
gradThe gradient."TS
indices>A vector of indices into the first dimension of var and accum."Tindices*
lr!Scaling factor. Must be a scalar."T-
l1$L1 regularization. Must be a scalar."T-
l2$L2 regularization. Must be a scalar."T0
lr_power!Scaling factor. Must be a scalar."T"
Ttype:
2	"
Tindicestype:
2	"­
use_lockingbool( "If `True`, updating of the var and accum tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*HUpdate relevant entries in '*var' according to the Ftrl-proximal scheme.2ČThat is for rows we have grad for, we update var, accum and linear as follows:
accum_new = accum + grad * grad
linear += grad + (accum_new^(-lr_power) - accum^(-lr_power)) / lr * var
quadratic = 1.0 / (accum_new^(lr_power) * lr) + 2 * l2
var = (sign(linear) * l1 - linear) / quadratic if |linear| > l1 else 0.0
accum = accum_new
ą
ResourceSparseApplyMomentum%
varShould be from a Variable().'
accumShould be from a Variable().)
lr Learning rate. Must be a scalar."T
gradThe gradient."TS
indices>A vector of indices into the first dimension of var and accum."Tindices*
momentumMomentum. Must be a scalar."T"
Ttype:
2	"
Tindicestype:
2	"­
use_lockingbool( "If `True`, updating of the var and accum tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention."“
use_nesterovbool( "If `True`, the tensor passed to compute grad will be
var - lr * momentum * accum, so in the end, the var you get is actually
var - lr * momentum * accum.*PUpdate relevant entries in '*var' and '*accum' according to the momentum scheme.2øSet use_nesterov = True if you want to use Nesterov momentum.

That is for rows we have grad for, we update var and accum as follows:

accum = accum * momentum + grad
var -= lr * accum
ē
"ResourceSparseApplyProximalAdagrad%
varShould be from a Variable().'
accumShould be from a Variable().)
lr Learning rate. Must be a scalar."T-
l1$L1 regularization. Must be a scalar."T-
l2$L2 regularization. Must be a scalar."T
gradThe gradient."TS
indices>A vector of indices into the first dimension of var and accum."Tindices"
Ttype:
2	"
Tindicestype:
2	"«
use_lockingbool( "If True, updating of the var and accum tensors will be protected by
a lock; otherwise the behavior is undefined, but may exhibit less contention.*JSparse update entries in '*var' and '*accum' according to FOBOS algorithm.2ÅThat is for rows we have grad for, we update var and accum as follows:
accum += grad * grad
prox_v = var
prox_v -= lr * grad * (1 / sqrt(accum))
var = sign(prox_v)/(1+lr*l2) * max{|prox_v|-lr*l1,0}
ų
*ResourceSparseApplyProximalGradientDescent%
varShould be from a Variable().-
alpha!Scaling factor. Must be a scalar."T-
l1$L1 regularization. Must be a scalar."T-
l2$L2 regularization. Must be a scalar."T
gradThe gradient."TS
indices>A vector of indices into the first dimension of var and accum."Tindices"
Ttype:
2	"
Tindicestype:
2	"
use_lockingbool( "{If True, the subtraction will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*ASparse update '*var' as FOBOS algorithm with fixed learning rate.2That is for rows we have grad for, we update var as follows:
prox_v = var - alpha * grad
var = sign(prox_v)/(1+alpha*l2) * max{|prox_v|-alpha*l1,0}
ł
ResourceSparseApplyRMSProp%
varShould be from a Variable().$
msShould be from a Variable().%
momShould be from a Variable().*
lr!Scaling factor. Must be a scalar."T'
rhoDecay rate. Must be a scalar."T
momentum"T+
epsilonRidge term. Must be a scalar."T
gradThe gradient."TU
indices@A vector of indices into the first dimension of var, ms and mom."Tindices"
Ttype:
2	"
Tindicestype:
2	"«
use_lockingbool( "If `True`, updating of the var, ms, and mom tensors is protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*1Update '*var' according to the RMSProp algorithm.2ŹNote that in dense implementation of this algorithm, ms and mom will
update even if the grad is zero, but in this sparse implementation, ms
and mom will not update in iterations during which the grad is zero.

mean_square = decay * mean_square + (1-decay) * gradient ** 2
Delta = learning_rate * gradient / sqrt(mean_square + epsilon)

ms <- rho * ms_{t-1} + (1-rho) * grad * grad
mom <- momentum * mom_{t-1} + lr * grad / sqrt(ms + epsilon)
var <- var - mom
©

Restoree
file_patternSMust have a single element. The pattern of the files from
which we read the tensor.S
tensor_nameBMust have a single element. The name of the tensor to be
restored."
tensorThe restored tensor."dt"2
dttype"&The type of the tensor to be restored."h
preferred_shardint’’’’’’’’’"CIndex of file to open first if multiple files match
`file_pattern`.*(Restores a tensor from checkpoint files.2õReads a tensor stored in one or several files. If there are several files (for
instance because a tensor was saved as slices), `file_pattern` may contain
wildcard symbols (`*` and `?`) in the filename portion only, not in the
directory portion.

If a `file_pattern` matches several files, `preferred_shard` can be used to hint
in which file the requested tensor is likely to be found. This op will first
open the file at index `preferred_shard` in the list of matching files and try
to restore tensors from that file.  Only if some tensors or tensor slices are
not found in that first file, then the Op opens all the files. Setting
`preferred_shard` to match the value passed as the `shard` input
of a matching `Save` Op may speed up Restore.  This attribute only affects
performance, not correctness.  The default value -1 means files are processed in
order.

See also `RestoreSlice`.

RestoreSlicee
file_patternSMust have a single element. The pattern of the files from
which we read the tensor.S
tensor_nameBMust have a single element. The name of the tensor to be
restored.a
shape_and_sliceLScalar. The shapes and slice specifications to use when
restoring a tensors."
tensorThe restored tensor."dt"2
dttype"&The type of the tensor to be restored."
preferred_shardint’’’’’’’’’"hIndex of file to open first if multiple files match
`file_pattern`. See the documentation for `Restore`.*(Restores a tensor from checkpoint files.2ŃThis is like `Restore` except that restored tensor can be listed as filling
only a slice of a larger tensor.  `shape_and_slice` specifies the shape of the
larger tensor and the slice that the restored tensor covers.

The `shape_and_slice` input has the same format as the
elements of the `shapes_and_slices` input of the `SaveSlices` op.
õ	
	RestoreV2G
prefix;Must have a single element.  The prefix of a V2 checkpoint.F
tensor_names4shape {N}.  The names of the tensors to be restored.
shape_and_slicesxshape {N}.  The slice specs of the tensors to be restored.
Empty strings indicate that they are non-partitioned tensors.h
tensorsUshape {N}.  The restored tensors, whose shapes are read from the
checkpoint directly.2dtypes"}
dtypes
list(type)"cshape {N}.  The list of expected dtype for the tensors.  Must match
those stored in the checkpoint.(0*&Restores tensors from a V2 checkpoint.2“For backward compatibility with the V1 format, this Op currently allows
restoring from a V1 checkpoint as well:
  - This Op first attempts to find the V2 index file pointed to by "prefix", and
    if found proceed to read it as a V2 checkpoint;
  - Otherwise the V1 read path is invoked.
Relying on this behavior is not recommended, as the ability to fall back to read
V1 might be deprecated and eventually removed.

By default, restores the named tensors in full.  If the caller wishes to restore
specific slices of stored tensors, "shape_and_slices" should be non-empty
strings and correspondingly well-formed.

Callers must ensure all the named tensors are indeed stored in the checkpoint.

Reverse
tensor
Up to 8-D."T)
dims1-D. The dimensions to reverse.
(
outputThe same shape as `tensor`."T"
Ttype:
2
	
*)Reverses specific dimensions of a tensor.2ŪGiven a `tensor`, and a `bool` tensor `dims` representing the dimensions
of `tensor`, this operation reverses each dimension i of `tensor` where
`dims[i]` is `True`.

`tensor` can have up to 8 dimensions. The number of dimensions
of `tensor` must equal the number of elements in `dims`. In other words:

`rank(tensor) = size(dims)`

For example:

```prettyprint
# tensor 't' is [[[[ 0,  1,  2,  3],
#                  [ 4,  5,  6,  7],
#                  [ 8,  9, 10, 11]],
#                 [[12, 13, 14, 15],
#                  [16, 17, 18, 19],
#                  [20, 21, 22, 23]]]]
# tensor 't' shape is [1, 2, 3, 4]

# 'dims' is [False, False, False, True]
reverse(t, dims) ==> [[[[ 3,  2,  1,  0],
                        [ 7,  6,  5,  4],
                        [ 11, 10, 9, 8]],
                       [[15, 14, 13, 12],
                        [19, 18, 17, 16],
                        [23, 22, 21, 20]]]]

# 'dims' is [False, True, False, False]
reverse(t, dims) ==> [[[[12, 13, 14, 15],
                        [16, 17, 18, 19],
                        [20, 21, 22, 23]
                       [[ 0,  1,  2,  3],
                        [ 4,  5,  6,  7],
                        [ 8,  9, 10, 11]]]]

# 'dims' is [False, False, True, False]
reverse(t, dims) ==> [[[[8, 9, 10, 11],
                        [4, 5, 6, 7],
                        [0, 1, 2, 3]]
                       [[20, 21, 22, 23],
                        [16, 17, 18, 19],
                        [12, 13, 14, 15]]]]
```
½
ReverseSequence!
inputThe input to reverse."Ti
seq_lengthsT1-D with length `input.dims(batch_dim)` and
`max(seq_lengths) < input.dims(seq_dim)`"TlenL
output?The partially reversed input. It has the same shape as `input`."T":
seq_dimint"*The dimension which is partially reversed."F
	batch_dimint "0The dimension along which reversal is performed."	
Ttype"
Tlentype0	:
2	* Reverses variable length slices.2This op first slices `input` along the dimension `batch_dim`, and for each
slice `i`, reverses the first `seq_lengths[i]` elements along
the dimension `seq_dim`.

The elements of `seq_lengths` must obey `seq_lengths[i] < input.dims[seq_dim]`,
and `seq_lengths` must be a vector of length `input.dims[batch_dim]`.

The output slice `i` along dimension `batch_dim` is then given by input
slice `i`, with the first `seq_lengths[i]` slices along dimension
`seq_dim` reversed.

For example:

```prettyprint
# Given this:
batch_dim = 0
seq_dim = 1
input.dims = (4, 8, ...)
seq_lengths = [7, 2, 3, 5]

# then slices of input are reversed on seq_dim, but only up to seq_lengths:
output[0, 0:7, :, ...] = input[0, 7:0:-1, :, ...]
output[1, 0:2, :, ...] = input[1, 2:0:-1, :, ...]
output[2, 0:3, :, ...] = input[2, 3:0:-1, :, ...]
output[3, 0:5, :, ...] = input[3, 5:0:-1, :, ...]

# while entries past seq_lens are copied through:
output[0, 7:, :, ...] = input[0, 7:, :, ...]
output[1, 2:, :, ...] = input[1, 2:, :, ...]
output[2, 3:, :, ...] = input[2, 3:, :, ...]
output[3, 2:, :, ...] = input[3, 2:, :, ...]
```

In contrast, if:

```prettyprint
# Given this:
batch_dim = 2
seq_dim = 0
input.dims = (8, ?, 4, ...)
seq_lengths = [7, 2, 3, 5]

# then slices of input are reversed on seq_dim, but only up to seq_lengths:
output[0:7, :, 0, :, ...] = input[7:0:-1, :, 0, :, ...]
output[0:2, :, 1, :, ...] = input[2:0:-1, :, 1, :, ...]
output[0:3, :, 2, :, ...] = input[3:0:-1, :, 2, :, ...]
output[0:5, :, 3, :, ...] = input[5:0:-1, :, 3, :, ...]

# while entries past seq_lens are copied through:
output[7:, :, 0, :, ...] = input[7:, :, 0, :, ...]
output[2:, :, 1, :, ...] = input[2:, :, 1, :, ...]
output[3:, :, 2, :, ...] = input[3:, :, 2, :, ...]
output[2:, :, 3, :, ...] = input[2:, :, 3, :, ...]
```

	ReverseV2
tensor
Up to 8-D."T<
axis.1-D. The indices of the dimensions to reverse."Tidx(
outputThe same shape as `tensor`."T"
Tidxtype0:
2	"
Ttype:
2
	
*)Reverses specific dimensions of a tensor.2NOTE `tf.reverse` has now changed behavior in preparation for 1.0.
`tf.reverse_v2` is currently an alias that will be deprecated before TF 1.0.

Given a `tensor`, and a `int32` tensor `axis` representing the set of
dimensions of `tensor` to reverse. This operation reverses each dimension
`i` for which there exists `j` s.t. `axis[j] == i`.

`tensor` can have up to 8 dimensions. The number of dimensions specified
in `axis` may be 0 or more entries. If an index is specified more than
once, a InvalidArgument error is raised.

For example:

```prettyprint
# tensor 't' is [[[[ 0,  1,  2,  3],
#                  [ 4,  5,  6,  7],
#                  [ 8,  9, 10, 11]],
#                 [[12, 13, 14, 15],
#                  [16, 17, 18, 19],
#                  [20, 21, 22, 23]]]]
# tensor 't' shape is [1, 2, 3, 4]

# 'dims' is [3] or 'dims' is -1
reverse(t, dims) ==> [[[[ 3,  2,  1,  0],
                        [ 7,  6,  5,  4],
                        [ 11, 10, 9, 8]],
                       [[15, 14, 13, 12],
                        [19, 18, 17, 16],
                        [23, 22, 21, 20]]]]

# 'dims' is '[1]' (or 'dims' is '[-3]')
reverse(t, dims) ==> [[[[12, 13, 14, 15],
                        [16, 17, 18, 19],
                        [20, 21, 22, 23]
                       [[ 0,  1,  2,  3],
                        [ 4,  5,  6,  7],
                        [ 8,  9, 10, 11]]]]

# 'dims' is '[2]' (or 'dims' is '[-2]')
reverse(t, dims) ==> [[[[8, 9, 10, 11],
                        [4, 5, 6, 7],
                        [0, 1, 2, 3]]
                       [[20, 21, 22, 23],
                        [16, 17, 18, 19],
                        [12, 13, 14, 15]]]]
```
Ę
Rint
x"T
y"T"
Ttype:
2**Returns element-wise integer closest to x.2īIf the result is midway between two representable values,
the even representable is chosen.
For example:

```
rint(-1.5) ==> -2.0
rint(0.5000001) ==> 1.0
rint([-1.7, -1.5, -0.2, 0.2, 1.5, 1.7, 2.0]) ==> [-2., -2., -0., 0., 2., 2., 2.]
```
ž
Round
x"T
y"T"
Ttype:
	2	*CRounds the values of a tensor to the nearest integer, element-wise.2Rounds half to even.  Also known as bankers rounding. If you want to round
according to the current system rounding mode use std::cint.

Rsqrt
x"T
y"T"
Ttype:	
2*5Computes reciprocal of square root of x element-wise.2I.e., \\(y = 1 / \sqrt{x}\\).
į
	RsqrtGrad
x"T
y"T
z"T"
Ttype:	
2*9Computes the gradient for the rsqrt of `x` wrt its input.2kSpecifically, `grad = dy * -0.5 * y^3`, where `y = rsqrt(x)`, and `dy`
is the corresponding input gradient.
ü
SampleDistortedBoundingBox=

image_size,1-D, containing `[height, width, channels]`."Tm
bounding_boxesY3-D with shape `[batch, N, 4]` describing the N bounding boxes
associated with the image._
beginS1-D, containing `[offset_height, offset_width, 0]`. Provide as input to
`tf.slice`."T_
sizeT1-D, containing `[target_height, target_width, -1]`. Provide as input to
`tf.slice`."T
bboxesu3-D with shape `[1, 1, 4]` containing the distorted bounding box.
Provide as input to `tf.image.draw_bounding_boxes`."
Ttype:	
2	"Ø
seedint "If either `seed` or `seed2` are set to non-zero, the random number
generator is seeded by the given `seed`.  Otherwise, it is seeded by a random
seed."8
seed2int "&A second seed to avoid seed collision."
min_object_coveredfloat%ĶĢĢ="óThe cropped area of the image must contain at least this
fraction of any bounding box supplied. The value of this parameter should be
non-negative. In the case of 0, the cropped area does not need to overlap
any of the bounding boxes supplied."
aspect_ratio_rangelist(float)

"  @?q=Ŗ?"[The cropped area of the image must have an aspect ratio =
width / height within this range."

area_rangelist(float)

"ĶĢL=  ?"aThe cropped area of the image must contain a fraction of the
supplied image within in this range."®
max_attemptsintd"Number of attempts at generating a cropped region of the image
of the specified constraints. After `max_attempts` failures, return the entire
image."ŗ
use_image_if_no_bounding_boxesbool( "Controls behavior if no bounding boxes supplied.
If true, assume an implicit bounding box covering the whole input. If false,
raise an error.*?Generate a single randomly distorted bounding box for an image.2Bounding box annotations are often supplied in addition to ground-truth labels
in image recognition or object localization tasks. A common technique for
training such a system is to randomly distort an image while preserving
its content, i.e. *data augmentation*. This Op outputs a randomly distorted
localization of an object, i.e. bounding box, given an `image_size`,
`bounding_boxes` and a series of constraints.

The output of this Op is a single bounding box that may be used to crop the
original image. The output is returned as 3 tensors: `begin`, `size` and
`bboxes`. The first 2 tensors can be fed directly into `tf.slice` to crop the
image. The latter may be supplied to `tf.image.draw_bounding_boxes` to visualize
what the bounding box looks like.

Bounding boxes are supplied and returned as `[y_min, x_min, y_max, x_max]`. The
bounding box coordinates are floats in `[0.0, 1.0]` relative to the width and
height of the underlying image.

For example,

```python
    # Generate a single distorted bounding box.
    begin, size, bbox_for_draw = tf.image.sample_distorted_bounding_box(
        tf.shape(image),
        bounding_boxes=bounding_boxes)

    # Draw the bounding box in an image summary.
    image_with_box = tf.image.draw_bounding_boxes(tf.expand_dims(image, 0),
                                                  bbox_for_draw)
    tf.image_summary('images_with_box', image_with_box)

    # Employ the bounding box to distort the image.
    distorted_image = tf.slice(image, begin, size)
```

Note that if no bounding box information is available, setting
`use_image_if_no_bounding_boxes = true` will assume there is a single implicit
bounding box covering the whole image. If `use_image_if_no_bounding_boxes` is
false and no bounding boxes are supplied, an error is raised.
£
Save\
filenameNMust have a single element. The name of the file to which we write
the tensor.D
tensor_names2Shape `[N]`. The names of the tensors to be saved.
data`N` tensors to save.2T"
T
list(type)(0* Saves the input tensors to disk.2The size of `tensor_names` must match the number of tensors in `data`. `data[i]`
is written to `filename` with name `tensor_names[i]`.

See also `SaveSlices`.
§


SaveSlices\
filenameNMust have a single element. The name of the file to which we write the
tensor.D
tensor_names2Shape `[N]`. The names of the tensors to be saved.h
shapes_and_slicesQShape `[N]`.  The shapes and slice specifications to use when
saving the tensors.
data`N` tensors to save.2T"
T
list(type)(0*#Saves input tensors slices to disk.2ÆThis is like `Save` except that tensors can be listed in the saved file as being
a slice of a larger tensor.  `shapes_and_slices` specifies the shape of the
larger tensor and the slice that this tensor covers. `shapes_and_slices` must
have as many elements as `tensor_names`.

Elements of the `shapes_and_slices` input must either be:

*  The empty string, in which case the corresponding tensor is
   saved normally.
*  A string of the form `dim0 dim1 ... dimN-1 slice-spec` where the
   `dimI` are the dimensions of the larger tensor and `slice-spec`
   specifies what part is covered by the tensor to save.

`slice-spec` itself is a `:`-separated list: `slice0:slice1:...:sliceN-1`
where each `sliceI` is either:

*  The string `-` meaning that the slice covers all indices of this dimension
*  `start,length` where `start` and `length` are integers.  In that
   case the slice covers `length` indices starting at `start`.

See also `Save`.
ė
SaveV2f
prefixZMust have a single element. The prefix of the V2 checkpoint to which we
write the tensors.B
tensor_names0shape {N}. The names of the tensors to be saved.
shape_and_slicesushape {N}.  The slice specs of the tensors to be saved.
Empty strings indicate that they are non-partitioned tensors.'
tensors`N` tensors to save.2dtypes"
dtypes
list(type)(0*&Saves tensors in V2 checkpoint format.2»By default, saves the named tensors in full.  If the caller wishes to save
specific slices of full tensors, "shape_and_slices" should be non-empty strings
and correspondingly well-formed.

ScalarSummary
tagsTags for the summary.:
values-Same shape as `tags.  Values for the summary."T;
summary.Scalar.  Serialized `Summary` protocol buffer."
Ttype:
2		*7Outputs a `Summary` protocol buffer with scalar values.2The input `tags` and `values` must have the same shape.  The generated summary
has a summary value for each tag-value pair in `tags` and `values`.
£


ScatterAdd.
ref!Should be from a `Variable` node."TK
indices6A tensor of indices into the first dimension of `ref`."Tindices9
updates+A tensor of updated values to add to `ref`."T

output_refx= Same as `ref`.  Returned as a convenience for operations that want
to use the updated values after the update is done."T"
Ttype:
2	"
Tindicestype:
2	"
use_lockingbool( "xIf True, the addition will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*,Adds sparse updates to a variable reference.2ŅThis operation computes

    # Scalar indices
    ref[indices, ...] += updates[...]

    # Vector indices (for each i)
    ref[indices[i], ...] += updates[i, ...]

    # High rank indices (for each i, ..., j)
    ref[indices[i, ..., j], ...] += updates[i, ..., j, ...]

This operation outputs `ref` after the update is done.
This makes it easier to chain operations that need to use the reset value.

Duplicate entries are handled correctly: if multiple `indices` reference
the same location, their contributions add.

Requires `updates.shape = indices.shape + ref.shape[1:]`.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/ScatterAdd.png" alt>
</div>
	

ScatterDiv.
ref!Should be from a `Variable` node."TK
indices6A tensor of indices into the first dimension of `ref`."Tindices:
updates,A tensor of values that `ref` is divided by."T

output_refx= Same as `ref`.  Returned as a convenience for operations that want
to use the updated values after the update is done."T"
Ttype:
2	"
Tindicestype:
2	"
use_lockingbool( "yIf True, the operation will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*/Divides a variable reference by sparse updates.2ĆThis operation computes

    # Scalar indices
    ref[indices, ...] /= updates[...]

    # Vector indices (for each i)
    ref[indices[i], ...] /= updates[i, ...]

    # High rank indices (for each i, ..., j)
    ref[indices[i, ..., j], ...] /= updates[i, ..., j, ...]

This operation outputs `ref` after the update is done.
This makes it easier to chain operations that need to use the reset value.

Duplicate entries are handled correctly: if multiple `indices` reference
the same location, their contributions divide.

Requires `updates.shape = indices.shape + ref.shape[1:]`.
¤	

ScatterMul.
ref!Should be from a `Variable` node."TK
indices6A tensor of indices into the first dimension of `ref`."Tindices>
updates0A tensor of updated values to multiply to `ref`."T

output_refx= Same as `ref`.  Returned as a convenience for operations that want
to use the updated values after the update is done."T"
Ttype:
2	"
Tindicestype:
2	"
use_lockingbool( "yIf True, the operation will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*4Multiplies sparse updates into a variable reference.2ÅThis operation computes

    # Scalar indices
    ref[indices, ...] *= updates[...]

    # Vector indices (for each i)
    ref[indices[i], ...] *= updates[i, ...]

    # High rank indices (for each i, ..., j)
    ref[indices[i, ..., j], ...] *= updates[i, ..., j, ...]

This operation outputs `ref` after the update is done.
This makes it easier to chain operations that need to use the reset value.

Duplicate entries are handled correctly: if multiple `indices` reference
the same location, their contributions multiply.

Requires `updates.shape = indices.shape + ref.shape[1:]`.

	ScatterNdn
indicesYA Tensor. Must be one of the following types: int32, int64.
A tensor of indices into ref."Tindicesf
updatesXA Tensor. Must have the same type as tensor. A tensor of updated values
to store in ref."T?
shape,A vector. The shape of the resulting tensor."Tindices\
outputOA new tensor with the given shape and updates applied according
to the indices."T"	
Ttype"
Tindicestype:
2	*?Creates a new tensor by applying sparse `updates` to individual2values or slices within a zero tensor of the given `shape` tensor according to
indices.  This operator is the inverse of the [tf.gather_nd](#gather_nd)
operator which extracts values or slices from a given tensor.

TODO(simister): Add a link to Variable.__getitem__ documentation on slice
syntax.

`shape` is a `TensorShape` with rank `P` and `indices` is a `Tensor` of rank
`Q`.

`indices` must be integer tensor, containing indices into `shape`.
It must be shape `[d_0, ..., d_{Q-2}, K]` where `0 < K <= P`.

The innermost dimension of `indices` (with length `K`) corresponds to
indices into elements (if `K = P`) or slices (if `K < P`) along the `K`th
dimension of `shape`.

`updates` is Tensor of rank `Q-1+P-K` with shape:

```
[d_0, ..., d_{Q-2}, shape[K], ..., shape[P-1]].
```

The simplest form of scatter is to insert individual elements in a tensor by
index. For example, say we want to insert 4 scattered elements in a rank-1
tensor with 8 elements.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/ScatterNd1.png" alt>
</div>

In Python, this scatter operation would look like this:

    indices = tf.constant([[4], [3], [1], [7]])
    updates = tf.constant([9, 10, 11, 12])
    shape = tf.constant([8])
    scatter = tf.scatter_nd(indices, updates, shape)
    with tf.Session() as sess:
      print sess.run(scatter)

The resulting tensor would look like this:

    [0, 11, 0, 10, 9, 0, 0, 12]

We can also, insert entire slices of a higher rank tensor all at once. For
example, if we wanted to insert two slices in the first dimension of a
rank-3 tensor with two matrices of new values.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/ScatterNd2.png" alt>
</div>

In Python, this scatter operation would look like this:

    indices = tf.constant([[0], [2]])
    updates = tf.constant([[[5, 5, 5, 5], [6, 6, 6, 6],
                            [7, 7, 7, 7], [8, 8, 8, 8]],
                           [[5, 5, 5, 5], [6, 6, 6, 6],
                            [7, 7, 7, 7], [8, 8, 8, 8]]])
    shape = tf.constant([4, 4, 4])
    scatter = tf.scatter_nd(indices, updates, shape)
    with tf.Session() as sess:
      print sess.run(scatter)

The resulting tensor would look like this:

    [[[5, 5, 5, 5], [6, 6, 6, 6], [7, 7, 7, 7], [8, 8, 8, 8]],
     [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]],
     [[5, 5, 5, 5], [6, 6, 6, 6], [7, 7, 7, 7], [8, 8, 8, 8]],
     [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]]
Æ
ScatterNdAdd>
ref1A mutable Tensor. Should be from a Variable node."Tn
indicesYA Tensor. Must be one of the following types: int32, int64.
A tensor of indices into ref."Tindicesa
updatesSA Tensor. Must have the same type as ref. A tensor of updated values
to add to ref."T

output_refsSame as ref. Returned as a convenience for operations that want
to use the updated values after the update is done."T"
Ttype:
2	"
Tindicestype:
2	"ø
use_lockingbool( "An optional bool. Defaults to True. If True, the assignment will
be protected by a lock; otherwise the behavior is undefined,
but may exhibit less contention.*IApplies sparse addition between `updates` and individual values or slices2Āwithin a given variable according to `indices`.

`ref` is a `Tensor` with rank `P` and `indices` is a `Tensor` of rank `Q`.

`indices` must be integer tensor, containing indices into `ref`.
It must be shape `[d_0, ..., d_{Q-2}, K]` where `0 < K <= P`.

The innermost dimension of `indices` (with length `K`) corresponds to
indices into elements (if `K = P`) or slices (if `K < P`) along the `K`th
dimension of `ref`.

`updates` is `Tensor` of rank `Q-1+P-K` with shape:

```
[d_0, ..., d_{Q-2}, ref.shape[K], ..., ref.shape[P-1]].
```

For example, say we want to add 4 scattered elements to a rank-1 tensor to 8
elements. In Python, that addition would look like this:

    ref = tf.Variable([1, 2, 3, 4, 5, 6, 7, 8])
    indices = tf.constant([[4], [3], [1], [7]])
    updates = tf.constant([9, 10, 11, 12])
    add = tf.scatter_nd_add(ref, indices, updates)
    with tf.Session() as sess:
      print sess.run(add)

The resulting update to ref would look like this:

    [1, 13, 3, 14, 14, 6, 7, 20]

See [tf.scatter_nd](#scatter_nd) for more details about how to make updates to
slices.
Å
ScatterNdSub>
ref1A mutable Tensor. Should be from a Variable node."Tn
indicesYA Tensor. Must be one of the following types: int32, int64.
A tensor of indices into ref."Tindicesh
updatesZA Tensor. Must have the same type as ref. A tensor of updated values
to subtract from ref."T

output_refsSame as ref. Returned as a convenience for operations that want
to use the updated values after the update is done."T"
Ttype:
2	"
Tindicestype:
2	"ø
use_lockingbool( "An optional bool. Defaults to True. If True, the assignment will
be protected by a lock; otherwise the behavior is undefined,
but may exhibit less contention.*LApplies sparse subtraction between `updates` and individual values or slices2Īwithin a given variable according to `indices`.

`ref` is a `Tensor` with rank `P` and `indices` is a `Tensor` of rank `Q`.

`indices` must be integer tensor, containing indices into `ref`.
It must be shape `[d_0, ..., d_{Q-2}, K]` where `0 < K <= P`.

The innermost dimension of `indices` (with length `K`) corresponds to
indices into elements (if `K = P`) or slices (if `K < P`) along the `K`th
dimension of `ref`.

`updates` is `Tensor` of rank `Q-1+P-K` with shape:

```
[d_0, ..., d_{Q-2}, ref.shape[K], ..., ref.shape[P-1]].
```

For example, say we want to subtract 4 scattered elements from a rank-1 tensor
with 8 elements. In Python, that subtraction would look like this:

    ref = tf.Variable([1, 2, 3, 4, 5, 6, 7, 8])
    indices = tf.constant([[4], [3], [1], [7]])
    updates = tf.constant([9, 10, 11, 12])
    sub = tf.scatter_nd_sub(ref, indices, updates)
    with tf.Session() as sess:
      print sess.run(sub)

The resulting update to ref would look like this:

    [1, -9, 3, -6, -4, 6, 7, -4]

See [tf.scatter_nd](#scatter_nd) for more details about how to make updates to
slices.

ScatterNdUpdate>
ref1A mutable Tensor. Should be from a Variable node."Tn
indicesYA Tensor. Must be one of the following types: int32, int64.
A tensor of indices into ref."Tindicesa
updatesSA Tensor. Must have the same type as ref. A tensor of updated
values to add to ref."T

output_refsSame as ref. Returned as a convenience for operations that want to
use the updated values after the update is done."T"	
Ttype"
Tindicestype:
2	"ø
use_lockingbool("An optional bool. Defaults to True. If True, the assignment will
be protected by a lock; otherwise the behavior is undefined,
but may exhibit less contention.*FApplies sparse `updates` to individual values or slices within a given2¼variable according to `indices`.

`ref` is a `Tensor` with rank `P` and `indices` is a `Tensor` of rank `Q`.

`indices` must be integer tensor, containing indices into `ref`.
It must be shape `[d_0, ..., d_{Q-2}, K]` where `0 < K <= P`.

The innermost dimension of `indices` (with length `K`) corresponds to
indices into elements (if `K = P`) or slices (if `K < P`) along the `K`th
dimension of `ref`.

`updates` is `Tensor` of rank `Q-1+P-K` with shape:

```
[d_0, ..., d_{Q-2}, ref.shape[K], ..., ref.shape[P-1]].
```

For example, say we want to update 4 scattered elements to a rank-1 tensor to
8 elements. In Python, that update would look like this:

    ref = tf.Variable([1, 2, 3, 4, 5, 6, 7, 8])
    indices = tf.constant([[4], [3], [1] ,[7]])
    updates = tf.constant([9, 10, 11, 12])
    update = tf.scatter_nd_update(ref, indices, updates)
    with tf.Session() as sess:
      print sess.run(update)

The resulting update to ref would look like this:

    [1, 11, 3, 10, 9, 6, 7, 12]

See [tf.scatter_nd](#scatter_nd) for more details about how to make updates to
slices.
£


ScatterSub.
ref!Should be from a `Variable` node."TK
indices6A tensor of indices into the first dimension of `ref`."Tindices@
updates2A tensor of updated values to subtract from `ref`."T

output_refx= Same as `ref`.  Returned as a convenience for operations that want
to use the updated values after the update is done."T"
Ttype:
2	"
Tindicestype:
2	"
use_lockingbool( "{If True, the subtraction will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*1Subtracts sparse updates to a variable reference.2Ć    # Scalar indices
    ref[indices, ...] -= updates[...]

    # Vector indices (for each i)
    ref[indices[i], ...] -= updates[i, ...]

    # High rank indices (for each i, ..., j)
    ref[indices[i, ..., j], ...] -= updates[i, ..., j, ...]

This operation outputs `ref` after the update is done.
This makes it easier to chain operations that need to use the reset value.

Duplicate entries are handled correctly: if multiple `indices` reference
the same location, their (negated) contributions add.

Requires `updates.shape = indices.shape + ref.shape[1:]`.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/ScatterSub.png" alt>
</div>
Ķ

ScatterUpdate.
ref!Should be from a `Variable` node."TK
indices6A tensor of indices into the first dimension of `ref`."Tindices;
updates-A tensor of updated values to store in `ref`."T

output_refx= Same as `ref`.  Returned as a convenience for operations that want
to use the updated values after the update is done."T"	
Ttype"
Tindicestype:
2	"
use_lockingbool("zIf True, the assignment will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*/Applies sparse updates to a variable reference.2This operation computes

    # Scalar indices
    ref[indices, ...] = updates[...]

    # Vector indices (for each i)
    ref[indices[i], ...] = updates[i, ...]

    # High rank indices (for each i, ..., j)
    ref[indices[i, ..., j], ...] = updates[i, ..., j, ...]

This operation outputs `ref` after the update is done.
This makes it easier to chain operations that need to use the reset value.

If values in `ref` is to be updated more than once, because there are
duplicate entries in `indices`, the order at which the updates happen
for each value is undefined.

Requires `updates.shape = indices.shape + ref.shape[1:]`.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/ScatterUpdate.png" alt>
</div>


SdcaFprint8
input-vector of strings to compute fingerprints on.
outputa (N,2) shaped matrix where N is the number of elements in the input
vector. Each row contains the low and high parts of the fingerprint.	*+Computes fingerprints of the input strings.
ę
SdcaOptimizera
sparse_example_indices0a list of vectors which contain example indices.	*num_sparse_featuresa
sparse_feature_indices0a list of vectors which contain feature indices.	*num_sparse_features
sparse_feature_valuesRa list of vectors which contains feature value
associated with each feature group.*num_sparse_features_with_valuesc
dense_features;a list of matrices which contains the dense feature values.*num_dense_featuresU
example_weights@a vector which contains the weight associated with each
example.Z
example_labelsFa vector which contains the label/target associated with each
example.Ą
sparse_indicesa list of vectors where each value is the indices which has
corresponding weights in sparse_weights. This field maybe ommitted for the
dense approach.	*num_sparse_features
sparse_weightsXa list of vectors where each value is the weight associated with
a sparse feature group.*num_sparse_features
dense_weightsYa list of vectors where the values are the weights associated
with a dense feature group.*num_dense_featuresL
example_state_data4a list of vectors containing the example state data.X
out_example_state_data<a list of vectors containing the updated example state
data.
out_delta_sparse_weights_a list of vectors where each value is the delta
weights associated with a sparse feature group.*num_sparse_features
out_delta_dense_weights_a list of vectors where the values are the delta
weights associated with a dense feature group.*num_dense_features"Æ
	loss_typestring"ZType of the primal loss. Currently SdcaSolver supports logistic,
squared and hinge losses.:>
<logistic_losssquared_loss
hinge_losssmooth_hinge_loss"I

adaptativebool( "1Whether to use Adapative SDCA for the inner loop."J
num_sparse_featuresint",Number of sparse feature groups to train on.("
num_sparse_features_with_valuesint"jNumber of sparse feature groups with values
associated with it, otherwise implicitly treats values as 1.0.("H
num_dense_featuresint"+Number of dense feature groups to train on.("2
l1float"%Symmetric l1 regularization strength."2
l2float"%Symmetric l2 regularization strength."Q
num_loss_partitionsint"1Number of partitions of the global loss function.(0"E
num_inner_iterationsint"$Number of iterations per mini-batch.(0*MDistributed version of Stochastic Dual Coordinate Ascent (SDCA) optimizer for2Šlinear models with L1 + L2 regularization. As global optimization objective is
strongly-convex, the optimizer optimizes the dual objective at each step. The
optimizer applies each update one example at a time. Examples are sampled
uniformly, and the optimizer is learning rate free and enjoys linear convergence
rate.

Proximal Stochastic Dual Coordinate Ascent, Shalev-Shwartz, Shai; Zhang, Tong.
2012 arXiv1211.2717S: http://arxiv.org/pdf/1211.2717v1.pdf

  Loss objective = \sum f_{i}(wx_{i}) + (l2 / 2) * |w|^2 + l1 * |w|

Adding vs. Averaging in Distributed Primal-Dual Optimization.
Chenxin Ma, Virginia Smith, Martin Jaggi, Michael I. Jordan, Peter Richtarik,
Martin Takac http://arxiv.org/abs/1502.03508

Stochastic Dual Coordinate Ascent with Adaptive Probabilities
Dominik Csiba, Zheng Qu, Peter Richtarik https://arxiv.org/abs/1502.08053

SdcaShrinkL1o
weightsQa list of vectors where each value is the weight associated with a
feature group.*num_features"H
num_featuresint"1Number of feature groups to apply shrinking step.("2
l1float"%Symmetric l1 regularization strength."N
l2float"ASymmetric l2 regularization strength. Should be a positive float.*8Applies L1 regularization shrink step on the parameters.
ö

SegmentMax	
data"T
segment_idswA 1-D tensor whose rank is equal to the rank of `data`'s
first dimension.  Values should be sorted and can be repeated."Tindicesg
outputZHas same shape as data, except for dimension 0 which
has size `k`, the number of segments."T"
Ttype:
2		"
Tindicestype:
2	*0Computes the maximum along segments of a tensor.2śRead [the section on Segmentation](../../api_docs/python/math_ops.md#segmentation)
for an explanation of segments.

Computes a tensor such that
\\(output_i = \max_j(data_j)\\) where `max` is over `j` such
that `segment_ids[j] == i`.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/SegmentMax.png" alt>
</div>
¬
SegmentMean	
data"T
segment_idswA 1-D tensor whose rank is equal to the rank of `data`'s
first dimension.  Values should be sorted and can be repeated."Tindicesg
outputZHas same shape as data, except for dimension 0 which
has size `k`, the number of segments."T"
Ttype:
2		"
Tindicestype:
2	*-Computes the mean along segments of a tensor.2²Read [the section on
Segmentation](../../api_docs/python/math_ops.md#segmentation) for an explanation
of segments.

Computes a tensor such that
\\(output_i = \frac{\sum_j data_j}{N}\\) where `mean` is
over `j` such that `segment_ids[j] == i` and `N` is the total number of
values summed.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/SegmentMean.png" alt>
</div>
ö

SegmentMin	
data"T
segment_idswA 1-D tensor whose rank is equal to the rank of `data`'s
first dimension.  Values should be sorted and can be repeated."Tindicesg
outputZHas same shape as data, except for dimension 0 which
has size `k`, the number of segments."T"
Ttype:
2		"
Tindicestype:
2	*0Computes the minimum along segments of a tensor.2śRead [the section on
Segmentation](../../api_docs/python/math_ops.md#segmentation) for an explanation
of segments.

Computes a tensor such that
\\(output_i = \min_j(data_j)\\) where `min` is over `j` such
that `segment_ids[j] == i`.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/SegmentMin.png" alt>
</div>

SegmentProd	
data"T
segment_idswA 1-D tensor whose rank is equal to the rank of `data`'s
first dimension.  Values should be sorted and can be repeated."Tindicesg
outputZHas same shape as data, except for dimension 0 which
has size `k`, the number of segments."T"
Ttype:
2	"
Tindicestype:
2	*0Computes the product along segments of a tensor.2Read [the section on
Segmentation](../../api_docs/python/math_ops.md#segmentation) for an explanation
of segments.

Computes a tensor such that
\\(output_i = \prod_j data_j\\) where the product is over `j` such
that `segment_ids[j] == i`.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/SegmentProd.png" alt>
</div>
ō

SegmentSum	
data"T
segment_idswA 1-D tensor whose rank is equal to the rank of `data`'s
first dimension.  Values should be sorted and can be repeated."Tindicesg
outputZHas same shape as data, except for dimension 0 which
has size `k`, the number of segments."T"
Ttype:
2	"
Tindicestype:
2	*,Computes the sum along segments of a tensor.2÷Read [the section on Segmentation](../../api_docs/python/math_ops.md#segmentation)
for an explanation of segments.

Computes a tensor such that
\\(output_i = \sum_j data_j\\) where sum is over `j` such
that `segment_ids[j] == i`.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/SegmentSum.png" alt>
</div>
ė
Select
	condition
³
tŖ= A `Tensor` which may have the same shape as `condition`.
If `condition` is rank 1, `t` may have higher rank,
but its first dimension must match the size of `condition`."T9
e1= A `Tensor` with the same type and shape as `t`."TF
output9= A `Tensor` with the same type and shape as `t` and `e`."T"	
Ttype*;Selects elements from `t` or `e`, depending on `condition`.2Š	The `t`, and `e` tensors must all have the same shape, and the
output will also have that shape.

The `condition` tensor must be a scalar if `t` and `e` are scalars.
If `t` and `e` are vectors or higher rank, then `condition` must be either a
scalar, a vector with size matching the first dimension of `t`, or must have
the same shape as `t`.

The `condition` tensor acts as a mask that chooses, based on the value at each
element, whether the corresponding element / row in the output should be
taken from `t` (if true) or `e` (if false).

If `condition` is a vector and `t` and `e` are higher rank matrices, then
it chooses which row (outer dimension) to copy from `t` and `e`.
If `condition` has the same shape as `t` and `e`, then it chooses which
element to copy from `t` and `e`.

For example:

```prettyprint
# 'condition' tensor is [[True,  False]
#                        [False, True]]
# 't' is [[1, 2],
#         [3, 4]]
# 'e' is [[5, 6],
#         [7, 8]]
select(condition, t, e) ==> [[1, 6],
                             [7, 4]]


# 'condition' tensor is [True, False]
# 't' is [[1, 2],
#         [3, 4]]
# 'e' is [[5, 6],
#         [7, 8]]
select(condition, t, e) ==> [[1, 2],
                             [7, 8]]

```

SelfAdjointEig#
inputShape is `[..., M, M]`."T&
outputShape is `[..., M+1, M]`."T"
Ttype:
2*LComputes the Eigen Decomposition of a batch of square self-adjoint matrices.2©The input is a tensor of shape `[..., M, M]` whose inner-most 2 dimensions
form square matrices, with the same constraints as the single matrix
SelfAdjointEig.

The result is a [..., M+1, M] matrix with [..., 0,:] containing the
eigenvalues, and subsequent [...,1:, :] containing the eigenvectors.B!Use SelfAdjointEigV2 instead.
Ā
SelfAdjointEigV2-
input!`Tensor` input of shape `[N, N]`."T$
eEigenvalues. Shape is `[N]`."T(
v Eigenvectors. Shape is `[N, N]`."T"
	compute_vbool("sIf `True` then eigenvectors will be computed and returned in `v`.
Otherwise, only the eigenvalues will be computed."
Ttype:
2*MComputes the eigen decomposition of one or more square self-adjoint matrices.2æComputes the eigenvalues and (optionally) eigenvectors of each inner matrix in
`input` such that `input[..., :, :] = v[..., :, :] * diag(e[..., :])`.

```prettyprint
# a is a tensor.
# e is a tensor of eigenvalues.
# v is a tensor of eigenvectors.
e, v = self_adjoint_eig(a)
e = self_adjoint_eig(a, compute_v=False)
```
Õ
SerializeManySparseH
sparse_indices42-D.  The `indices` of the minibatch `SparseTensor`.	G
sparse_values31-D.  The `values` of the minibatch `SparseTensor`."TD
sparse_shape21-D.  The `shape` of the minibatch `SparseTensor`.	
serialized_sparse"	
Ttype*KSerialize an `N`-minibatch `SparseTensor` into an `[N, 3]` string `Tensor`.2õThe `SparseTensor` must have rank `R` greater than 1, and the first dimension
is treated as the minibatch dimension.  Elements of the `SparseTensor`
must be sorted in increasing order of this first dimension.  The serialized
`SparseTensor` objects going into each row of `serialized_sparse` will have
rank `R-1`.

The minibatch size `N` is extracted from `sparse_shape[0]`.
ø
SerializeSparse>
sparse_indices*2-D.  The `indices` of the `SparseTensor`.	=
sparse_values)1-D.  The `values` of the `SparseTensor`."T:
sparse_shape(1-D.  The `shape` of the `SparseTensor`.	
serialized_sparse"	
Ttype*HSerialize a `SparseTensor` into a string 3-vector (1-D `Tensor`) object.

SetSize:
set_indices)2D `Tensor`, indices of a `SparseTensor`.	9

set_values(1D `Tensor`, values of a `SparseTensor`."T6
	set_shape'1D `Tensor`, shape of a `SparseTensor`.	Ń
sizeĘFor `set` ranked `n`, this is a `Tensor` with rank `n-1`, and the same 1st
`n-1` dimensions as `set`. Each value is the number of unique elements in
the corresponding `[0...n-1]` dimension of `set`."
validate_indicesbool("
Ttype:
	2	*>Number of unique elements along last dimension of input `set`.2Input `set` is a `SparseTensor` represented by `set_indices`, `set_values`,
and `set_shape`. The last dimension contains values in a set, duplicates are
allowed but ignored.

If `validate_indices` is `True`, this op validates the order and range of `set`
indices.
“
Shape

input"T
output"out_type"	
Ttype"
out_typetype0:
2	*Returns the shape of a tensor.2ĮThis operation returns a 1-D integer tensor representing the shape of `input`.

For example:

```prettyprint
# 't' is [[[1, 1, 1], [2, 2, 2]], [[3, 3, 3], [4, 4, 4]]]
shape(t) ==> [2, 2, 3]
```
Ń
ShapeN
input"T*N
output"out_type*N"
Nint(0"	
Ttype"
out_typetype0:
2	*Returns shape of tensors.2OThis operation returns N 1-D integer tensors representing shape of `input[i]s`.
¼
ShardedFilename
basename	
shard

num_shards
filename*@Generate a sharded filename. The filename is printf formatted as20   %s-%05d-of-%05d, basename, shard, num_shards.
w
ShardedFilespec
basename

num_shards
filename*8Generate a glob pattern matching all sharded file names.
~
Sigmoid
x"T
y"T"
Ttype:	
2*%Computes sigmoid of `x` element-wise.2&Specifically, `y = 1 / (1 + exp(-x))`.
ē
SigmoidGrad
x"T
y"T
z"T"
Ttype:	
2*:Computes the gradient of the sigmoid of `x` wrt its input.2nSpecifically, `grad = dy * y * (1 - y)`, where `y = sigmoid(x)`, and
`dy` is the corresponding input gradient.
÷
Sign
x"T
y"T"
Ttype:
	2	*;Returns an element-wise indication of the sign of a number.2`y = sign(x) = -1` if `x < 0`; 0 if `x == 0`; 1 if `x > 0`.

For complex numbers, `y = sign(x) = x / |x|` if `x != 0`, otherwise `y = 0`.
L
Sin
x"T
y"T"
Ttype:	
2*Computes sin of x element-wise.
Æ
Size

input"T
output"out_type"	
Ttype"
out_typetype0:
2	*Returns the size of a tensor.2¾This operation returns an integer representing the number of elements in
`input`.

For example:

```prettyprint
# 't' is [[[1, 1,, 1], [2, 2, 2]], [[3, 3, 3], [4, 4, 4]]]]
size(t) ==> 12
```
Ū
Skipgram0

vocab_word A vector of words in the corpus.H

vocab_freq8Frequencies of words. Sorted in the non-ascending order.@
words_per_epoch+Number of words per epoch in the data file.	,
current_epochThe current epoch number.F
total_words_processed+The total number of words processed so far.	#
examplesA vector of word ids.!
labelsA vector of word ids."0
filenamestring"The corpus's text file name.".

batch_sizeint"The size of produced batch."[
window_sizeint"CThe number of words to predict to the left and right of the target."e
	min_countint"OThe minimum number of word occurrences for it to be included in the
vocabulary."
	subsamplefloat%o:"zThreshold for word occurrence. Words that appear with higher
frequency will be randomly down-sampled. Set to 0 to disable.*3Parses a text file and creates a batch of examples.B]YMoving word2vec into tensorflow_models/tutorials and deprecating its ops here as a result
¦
Slice

input"T`
beginPbegin[i] specifies the offset into the 'i'th dimension of
'input' to slice from."Index
sizeósize[i] specifies the number of elements of the 'i'th dimension
of 'input' to slice. If size[i] is -1, all remaining elements in dimension
i are included in the slice (i.e. this is equivalent to setting
size[i] = input.dim_size(i) - begin[i])."Index
output"T"	
Ttype"
Indextype:
2	*Return a slice from 'input'.2ŪThe output tensor is a tensor with dimensions described by 'size'
whose values are extracted from 'input' starting at the offsets in
'begin'.

*Requirements*:
  0 <= begin[i] <= begin[i] + size[i] <= Di  for i in [0, n)

Softmax8
logits+2-D with shape `[batch_size, num_classes]`."T%
softmaxSame shape as `logits`."T"
Ttype:
2*Computes softmax activations.2jFor each batch `i` and class `j` we have

    softmax[i, j] = exp(logits[i, j]) / sum_j(exp(logits[i, j]))
Ž
SoftmaxCrossEntropyWithLogits.
featuresbatch_size x num_classes matrix"T
labels}batch_size x num_classes matrix
The caller must ensure that each batch of labels represents a valid
probability distribution."T0
loss%Per example loss (batch_size vector)."TJ
backprop;backpropagated gradients (batch_size x num_classes matrix)."T"
Ttype:
2*CComputes softmax cross entropy cost and gradients to backpropagate.2)Inputs are the logits, not probabilities.
s
Softplus
features"T
activations"T"
Ttype:
2		*,Computes softplus: `log(exp(features) + 1)`.
Š
SoftplusGradU
	gradientsEThe backpropagated gradients to the corresponding softplus operation."TT
featuresEThe features passed as input to the corresponding softplus operation."TB
	backprops2The gradients: `gradients / (1 + exp(-features))`."T"
Ttype:
2		*5Computes softplus gradients for a softplus operation.
{
Softsign
features"T
activations"T"
Ttype:
2		*4Computes softsign: `features / (abs(features) + 1)`.
Õ
SoftsignGradU
	gradientsEThe backpropagated gradients to the corresponding softsign operation."TT
featuresEThe features passed as input to the corresponding softsign operation."TG
	backprops7The gradients: `gradients / (1 + abs(-features)) ** 2`."T"
Ttype:
2		*5Computes softsign gradients for a softsign operation.
¼
SpaceToBatch;
input/4-D with shape `[batch, height, width, depth]`."Tļ
paddings×2-D tensor of non-negative integers with shape `[2, 2]`. It specifies
  the padding of the input with zeros across the spatial dimensions as follows:

      paddings = [[pad_top, pad_bottom], [pad_left, pad_right]]

  The effective spatial dimensions of the zero-padded input tensor will be:

      height_pad = pad_top + height + pad_bottom
      width_pad = pad_left + width + pad_right

The attr `block_size` must be greater than one. It indicates the block size.

  * Non-overlapping blocks of size `block_size x block size` in the height and
    width dimensions are rearranged into the batch dimension at each location.
  * The batch of the output tensor is `batch * block_size * block_size`.
  * Both height_pad and width_pad must be divisible by block_size.

The shape of the output will be:

    [batch*block_size*block_size, height_pad/block_size, width_pad/block_size,
     depth]

Some examples:

(1) For the following input of shape `[1, 2, 2, 1]` and block_size of 2:

```prettyprint
x = [[[[1], [2]], [[3], [4]]]]
```

The output tensor has shape `[4, 1, 1, 1]` and value:

```prettyprint
[[[[1]]], [[[2]]], [[[3]]], [[[4]]]]
```

(2) For the following input of shape `[1, 2, 2, 3]` and block_size of 2:

```prettyprint
x = [[[[1, 2, 3], [4, 5, 6]],
      [[7, 8, 9], [10, 11, 12]]]]
```

The output tensor has shape `[4, 1, 1, 3]` and value:

```prettyprint
[[[1, 2, 3]], [[4, 5, 6]], [[7, 8, 9]], [[10, 11, 12]]]
```

(3) For the following input of shape `[1, 4, 4, 1]` and block_size of 2:

```prettyprint
x = [[[[1],   [2],  [3],  [4]],
      [[5],   [6],  [7],  [8]],
      [[9],  [10], [11],  [12]],
      [[13], [14], [15],  [16]]]]
```

The output tensor has shape `[4, 2, 2, 1]` and value:

```prettyprint
x = [[[[1], [3]], [[5], [7]]],
     [[[2], [4]], [[10], [12]]],
     [[[5], [7]], [[13], [15]]],
     [[[6], [8]], [[14], [16]]]]
```

(4) For the following input of shape `[2, 2, 4, 1]` and block_size of 2:

```prettyprint
x = [[[[1],   [2],  [3],  [4]],
      [[5],   [6],  [7],  [8]]],
     [[[9],  [10], [11],  [12]],
      [[13], [14], [15],  [16]]]]
```

The output tensor has shape `[8, 1, 2, 1]` and value:

```prettyprint
x = [[[[1], [3]]], [[[9], [11]]], [[[2], [4]]], [[[10], [12]]],
     [[[5], [7]]], [[[13], [15]]], [[[6], [8]]], [[[14], [16]]]]
```

Among others, this operation is useful for reducing atrous convolution into
regular convolution."	Tpaddings
output"T"	
Ttype"
	Tpaddingstype0:
2	"

block_sizeint(0*'SpaceToBatch for 4-D tensors of type T.2This is a legacy version of the more general SpaceToBatchND.

Zero-pads and then rearranges (permutes) blocks of spatial data into batch.
More specifically, this op outputs a copy of the input tensor where values from
the `height` and `width` dimensions are moved to the `batch` dimension. After
the zero-padding, both `height` and `width` of the input must be divisible by the
block size.
«
SpaceToBatchND}
inputqN-D with shape `input_shape = [batch] + spatial_shape + remaining_shape`,
where spatial_shape has `M` dimensions."TK
block_shape.1-D with shape `[M]`, all values must be >= 1."Tblock_shape¤
paddings2-D with shape `[M, 2]`, all values must be >= 0.
  `paddings[i] = [pad_start, pad_end]` specifies the padding for input dimension
  `i + 1`, which corresponds to spatial dimension `i`.  It is required that
  `block_shape[i]` divides `input_shape[i + 1] + pad_start + pad_end`.

This operation is equivalent to the following steps:

1. Zero-pad the start and end of dimensions `[1, ..., M]` of the
   input according to `paddings` to produce `padded` of shape `padded_shape`.

2. Reshape `padded` to `reshaped_padded` of shape:

     [batch] +
     [padded_shape[1] / block_shape[0],
       block_shape[0],
      ...,
      padded_shape[M] / block_shape[M-1],
      block_shape[M-1]] +
     remaining_shape

3. Permute dimensions of `reshaped_padded` to produce
   `permuted_reshaped_padded` of shape:

     block_shape +
     [batch] +
     [padded_shape[1] / block_shape[0],
      ...,
      padded_shape[M] / block_shape[M-1]] +
     remaining_shape

4. Reshape `permuted_reshaped_padded` to flatten `block_shape` into the batch
   dimension, producing an output tensor of shape:

     [batch * prod(block_shape)] +
     [padded_shape[1] / block_shape[0],
      ...,
      padded_shape[M] / block_shape[M-1]] +
     remaining_shape

Some examples:

(1) For the following input of shape `[1, 2, 2, 1]`, `block_shape = [2, 2]`, and
    `paddings = [[0, 0], [0, 0]]`:

```prettyprint
x = [[[[1], [2]], [[3], [4]]]]
```

The output tensor has shape `[4, 1, 1, 1]` and value:

```prettyprint
[[[[1]]], [[[2]]], [[[3]]], [[[4]]]]
```

(2) For the following input of shape `[1, 2, 2, 3]`, `block_shape = [2, 2]`, and
    `paddings = [[0, 0], [0, 0]]`:

```prettyprint
x = [[[[1, 2, 3], [4, 5, 6]],
      [[7, 8, 9], [10, 11, 12]]]]
```

The output tensor has shape `[4, 1, 1, 3]` and value:

```prettyprint
[[[1, 2, 3]], [[4, 5, 6]], [[7, 8, 9]], [[10, 11, 12]]]
```

(3) For the following input of shape `[1, 4, 4, 1]`, `block_shape = [2, 2]`, and
    `paddings = [[0, 0], [0, 0]]`:

```prettyprint
x = [[[[1],   [2],  [3],  [4]],
      [[5],   [6],  [7],  [8]],
      [[9],  [10], [11],  [12]],
      [[13], [14], [15],  [16]]]]
```

The output tensor has shape `[4, 2, 2, 1]` and value:

```prettyprint
x = [[[[1], [3]], [[5], [7]]],
     [[[2], [4]], [[10], [12]]],
     [[[5], [7]], [[13], [15]]],
     [[[6], [8]], [[14], [16]]]]
```

(4) For the following input of shape `[2, 2, 4, 1]`, block_shape = `[2, 2]`, and
    paddings = `[[0, 0], [2, 0]]`:

```prettyprint
x = [[[[1],   [2],  [3],  [4]],
      [[5],   [6],  [7],  [8]]],
     [[[9],  [10], [11],  [12]],
      [[13], [14], [15],  [16]]]]
```

The output tensor has shape `[8, 1, 3, 1]` and value:

```prettyprint
x = [[[[0], [1], [3]]], [[[0], [9], [11]]],
     [[[0], [2], [4]]], [[[0], [10], [12]]],
     [[[0], [5], [7]]], [[[0], [13], [15]]],
     [[[0], [6], [8]]], [[[0], [14], [16]]]]
```

Among others, this operation is useful for reducing atrous convolution into
regular convolution."	Tpaddings
output"T"	
Ttype" 
Tblock_shapetype0:
2	"
	Tpaddingstype0:
2	*'SpaceToBatch for N-D tensors of type T.2£This operation divides "spatial" dimensions `[1, ..., M]` of the input into a
grid of blocks of shape `block_shape`, and interleaves these blocks with the
"batch" dimension (0) such that in the output, the spatial dimensions
`[1, ..., M]` correspond to the position within the grid, and the batch
dimension combines both the position within a spatial block and the original
batch position.  Prior to division into blocks, the spatial dimensions of the
input are optionally zero padded according to `paddings`.  See below for a
precise description.

SpaceToDepth

input"T
output"T"	
Ttype"5

block_sizeint"The size of the spatial block.(0*#SpaceToDepth for tensors of type T.2’Rearranges blocks of spatial data, into depth. More specifically,
this op outputs a copy of the input tensor where values from the `height`
and `width` dimensions are moved to the `depth` dimension.
The attr `block_size` indicates the input block size and how the data is moved.

  * Non-overlapping blocks of size `block_size x block size` are rearranged
    into depth at each location.
  * The depth of the output tensor is `input_depth * block_size * block_size`.
  * The input tensor's height and width must be divisible by block_size.

That is, assuming the input is in the shape:
`[batch, height, width, depth]`,
the shape of the output will be:
`[batch, height/block_size, width/block_size, depth*block_size*block_size]`

This operation requires that the input tensor be of rank 4, and that
`block_size` be >=1 and a divisor of both the input `height` and `width`.

This operation is useful for resizing the activations between convolutions
(but keeping all data), e.g. instead of pooling. It is also useful for training
purely convolutional models.

For example, given this input of shape `[1, 2, 2, 1]`, and block_size of 2:

```prettyprint
x = [[[[1], [2]],
      [[3], [4]]]]
```

This operation will output a tensor of shape `[1, 1, 1, 4]`:

```prettyprint
[[[[1, 2, 3, 4]]]]
```

Here, the input has a batch of 1 and each batch element has shape `[2, 2, 1]`,
the corresponding output will have a single element (i.e. width and height are
both 1) and will have a depth of 4 channels (1 * block_size * block_size).
The output element shape is `[1, 1, 4]`.

For an input tensor with larger depth, here of shape `[1, 2, 2, 3]`, e.g.

```prettyprint
x = [[[[1, 2, 3], [4, 5, 6]],
      [[7, 8, 9], [10, 11, 12]]]]
```

This operation, for block_size of 2, will return the following tensor of shape
`[1, 1, 1, 12]`

```prettyprint
[[[[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]]]]
```

Similarly, for the following input of shape `[1 4 4 1]`, and a block size of 2:

```prettyprint
x = [[[[1],   [2],  [5],  [6]],
      [[3],   [4],  [7],  [8]],
      [[9],  [10], [13],  [14]],
      [[11], [12], [15],  [16]]]]
```

the operator will return the following tensor of shape `[1 2 2 4]`:

```prettyprint
x = [[[[1, 2, 3, 4],
       [5, 6, 7, 8]],
      [[9, 10, 11, 12],
       [13, 14, 15, 16]]]]
```

SparseAccumulatorApplyGradient+
handleThe handle to a accumulator.O

local_step?The local_step value at which the sparse gradient was computed.	Y
gradient_indicesCIndices of the sparse gradient to be accumulated. Must be a
vector.	Į
gradient_values¦Values are the non-zero slices of the gradient, and must have
the same first dimension as indices, i.e., the nnz represented by indices and
values must be consistent."dtypeC
gradient_shape/Shape of the sparse gradient to be accumulated.	"~
dtypetype"[The data type of accumulated gradients. Needs to correspond to the type
of the accumulator.:
2	"
has_known_shapebool"kBoolean indicating whether gradient_shape is unknown, in which
case the input is ignored during validation.*OApplies a sparse gradient to a given accumulator. Does not add if local_step is2*lesser than the accumulator's global_step.
ī
SparseAccumulatorTakeGradient<
handle-The handle to a SparseConditionalAccumulator.M
num_required;Number of gradients required before we return an aggregate.H
indices;Indices of the average of the accumulated sparse gradients.	K
values:Values of the average of the accumulated sparse gradients."dtypeD
shape9Shape of the average of the accumulated sparse gradients.	"~
dtypetype"[The data type of accumulated gradients. Needs to correspond to the type
of the accumulator.:
2	*OExtracts the average sparse gradient in the given SparseConditionalAccumulator,2provided that sufficient (i.e., more than num_required) gradients have been
accumulated. The op will blocks until sufficient gradients have been
accumulated. If the accumulator has already aggregated more than num_required
gradients, it will return its average of the accumulated gradients.
Also automatically increments the recorded global_step in the accumulator by 1,
and resets the aggregate to 0.
“
	SparseAdd[
	a_indicesL2-D.  The `indices` of the first `SparseTensor`, size `[nnz, ndims]` Matrix.	S
a_valuesD1-D.  The `values` of the first `SparseTensor`, size `[nnz]` Vector."TR
a_shapeE1-D.  The `shape` of the first `SparseTensor`, size `[ndims]` Vector.	\
	b_indicesM2-D.  The `indices` of the second `SparseTensor`, size `[nnz, ndims]` Matrix.	T
b_valuesE1-D.  The `values` of the second `SparseTensor`, size `[nnz]` Vector."TS
b_shapeF1-D.  The `shape` of the second `SparseTensor`, size `[ndims]` Vector.	i
threshX0-D.  The magnitude threshold that determines if an output value/index
pair takes space."Treal
sum_indices	

sum_values"T
	sum_shape	"
Ttype:
2	"
Trealtype:
2		*BAdds two `SparseTensor` objects to produce another `SparseTensor`.2śThe input `SparseTensor` objects' indices are assumed ordered in standard
lexicographic order.  If this is not the case, before this step run
`SparseReorder` to restore index ordering.

By default, if two values sum to zero at some index, the output `SparseTensor`
would still include that particular location in its index, storing a zero in the
corresponding value slot.  To override this, callers can specify `thresh`,
indicating that if the sum has a magnitude strictly smaller than `thresh`, its
corresponding value and index would then not be included.  In particular,
`thresh == 0` (default) means everything is kept and actual thresholding happens
only for a positive value.

In the following shapes, `nnz` is the count after taking `thresh` into account.

SparseAddGrads
backprop_val_grad[1-D with shape `[nnz(sum)]`.  The gradient with respect to
the non-empty values of the sum."TS
	a_indicesD2-D.  The `indices` of the `SparseTensor` A, size `[nnz(A), ndims]`.	S
	b_indicesD2-D.  The `indices` of the `SparseTensor` B, size `[nnz(B), ndims]`.	Y
sum_indicesH2-D.  The `indices` of the sum `SparseTensor`, size
`[nnz(sum), ndims]`.	c

a_val_gradR1-D with shape `[nnz(A)]`. The gradient with respect to the
non-empty values of A."Tc

b_val_gradR1-D with shape `[nnz(B)]`. The gradient with respect to the
non-empty values of B."T"
Ttype:
2	*+The gradient operator for the SparseAdd op.2÷The SparseAdd op calculates A + B, where A, B, and the sum are all represented
as `SparseTensor` objects.  This op takes in the upstream gradient w.r.t.
non-empty values of the sum, and outputs the gradients w.r.t. the non-empty
values of A and B.
£
SparseApplyAdadelta
var"T+
accumShould be from a Variable()."T4
accum_update: Should be from a Variable()."T)
lr Learning rate. Must be a scalar."T)
rhoDecay factor. Must be a scalar."T0
epsilon"Constant factor. Must be a scalar."T
gradThe gradient."TS
indices>A vector of indices into the first dimension of var and accum."Tindices
outSame as "var"."T"
Ttype:
2	"
Tindicestype:
2	"«
use_lockingbool( "If True, updating of the var and accum tensors will be protected by
a lock; otherwise the behavior is undefined, but may exhibit less contention.*!var: Should be from a Variable().
ą
SparseApplyAdagrad)
varShould be from a Variable()."T+
accumShould be from a Variable()."T)
lr Learning rate. Must be a scalar."T
gradThe gradient."TS
indices>A vector of indices into the first dimension of var and accum."Tindices
outSame as "var"."T"
Ttype:
2	"
Tindicestype:
2	"­
use_lockingbool( "If `True`, updating of the var and accum tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*OUpdate relevant entries in '*var' and '*accum' according to the adagrad scheme.2That is for rows we have grad for, we update var and accum as follows:
accum += grad * grad
var -= lr * grad * (1 / sqrt(accum))
Č
SparseApplyAdagradDA)
varShould be from a Variable()."T:
gradient_accumulatorShould be from a Variable()."TB
gradient_squared_accumulatorShould be from a Variable()."T
gradThe gradient."TS
indices>A vector of indices into the first dimension of var and accum."Tindices)
lr Learning rate. Must be a scalar."T-
l1$L1 regularization. Must be a scalar."T-
l2$L2 regularization. Must be a scalar."T8
global_step'Training step number. Must be a scalar.	
outSame as "var"."T"
Ttype:
2	"
Tindicestype:
2	"«
use_lockingbool( "If True, updating of the var and accum tensors will be protected by
a lock; otherwise the behavior is undefined, but may exhibit less contention.*OUpdate entries in '*var' and '*accum' according to the proximal adagrad scheme.
Ķ
SparseApplyCenteredRMSProp)
varShould be from a Variable()."T(
mgShould be from a Variable()."T(
msShould be from a Variable()."T)
momShould be from a Variable()."T*
lr!Scaling factor. Must be a scalar."T'
rhoDecay rate. Must be a scalar."T
momentum"T+
epsilonRidge term. Must be a scalar."T
gradThe gradient."TU
indices@A vector of indices into the first dimension of var, ms and mom."Tindices
outSame as "var"."T"
Ttype:
2	"
Tindicestype:
2	"Æ
use_lockingbool( "If `True`, updating of the var, mg, ms, and mom tensors is
protected by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*:Update '*var' according to the centered RMSProp algorithm.2¾The centered RMSProp algorithm uses an estimate of the centered second moment
(i.e., the variance) for normalization, as opposed to regular RMSProp, which
uses the (uncentered) second moment. This often helps with training, but is
slightly more expensive in terms of computation and memory.

Note that in dense implementation of this algorithm, mg, ms, and mom will
update even if the grad is zero, but in this sparse implementation, mg, ms,
and mom will not update in iterations during which the grad is zero.

mean_square = decay * mean_square + (1-decay) * gradient ** 2
mean_grad = decay * mean_grad + (1-decay) * gradient
Delta = learning_rate * gradient / sqrt(mean_square + epsilon - mean_grad ** 2)

ms <- rho * ms_{t-1} + (1-rho) * grad * grad
mom <- momentum * mom_{t-1} + lr * grad / sqrt(ms + epsilon)
var <- var - mom
Ż
SparseApplyFtrl)
varShould be from a Variable()."T+
accumShould be from a Variable()."T,
linearShould be from a Variable()."T
gradThe gradient."TS
indices>A vector of indices into the first dimension of var and accum."Tindices*
lr!Scaling factor. Must be a scalar."T-
l1$L1 regularization. Must be a scalar."T-
l2$L2 regularization. Must be a scalar."T0
lr_power!Scaling factor. Must be a scalar."T
outSame as "var"."T"
Ttype:
2	"
Tindicestype:
2	"­
use_lockingbool( "If `True`, updating of the var and accum tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*HUpdate relevant entries in '*var' according to the Ftrl-proximal scheme.2ČThat is for rows we have grad for, we update var, accum and linear as follows:
accum_new = accum + grad * grad
linear += grad + (accum_new^(-lr_power) - accum^(-lr_power)) / lr * var
quadratic = 1.0 / (accum_new^(lr_power) * lr) + 2 * l2
var = (sign(linear) * l1 - linear) / quadratic if |linear| > l1 else 0.0
accum = accum_new
ż
SparseApplyMomentum)
varShould be from a Variable()."T+
accumShould be from a Variable()."T)
lr Learning rate. Must be a scalar."T
gradThe gradient."TS
indices>A vector of indices into the first dimension of var and accum."Tindices*
momentumMomentum. Must be a scalar."T
outSame as "var"."T"
Ttype:
2	"
Tindicestype:
2	"­
use_lockingbool( "If `True`, updating of the var and accum tensors will be protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention."“
use_nesterovbool( "If `True`, the tensor passed to compute grad will be
var - lr * momentum * accum, so in the end, the var you get is actually
var - lr * momentum * accum.*PUpdate relevant entries in '*var' and '*accum' according to the momentum scheme.2øSet use_nesterov = True if you want to use Nesterov momentum.

That is for rows we have grad for, we update var and accum as follows:

accum = accum * momentum + grad
var -= lr * accum

SparseApplyProximalAdagrad)
varShould be from a Variable()."T+
accumShould be from a Variable()."T)
lr Learning rate. Must be a scalar."T-
l1$L1 regularization. Must be a scalar."T-
l2$L2 regularization. Must be a scalar."T
gradThe gradient."TS
indices>A vector of indices into the first dimension of var and accum."Tindices
outSame as "var"."T"
Ttype:
2	"
Tindicestype:
2	"«
use_lockingbool( "If True, updating of the var and accum tensors will be protected by
a lock; otherwise the behavior is undefined, but may exhibit less contention.*JSparse update entries in '*var' and '*accum' according to FOBOS algorithm.2ÅThat is for rows we have grad for, we update var and accum as follows:
accum += grad * grad
prox_v = var
prox_v -= lr * grad * (1 / sqrt(accum))
var = sign(prox_v)/(1+lr*l2) * max{|prox_v|-lr*l1,0}

"SparseApplyProximalGradientDescent)
varShould be from a Variable()."T-
alpha!Scaling factor. Must be a scalar."T-
l1$L1 regularization. Must be a scalar."T-
l2$L2 regularization. Must be a scalar."T
gradThe gradient."TS
indices>A vector of indices into the first dimension of var and accum."Tindices
outSame as "var"."T"
Ttype:
2	"
Tindicestype:
2	"
use_lockingbool( "{If True, the subtraction will be protected by a lock;
otherwise the behavior is undefined, but may exhibit less contention.*ASparse update '*var' as FOBOS algorithm with fixed learning rate.2That is for rows we have grad for, we update var as follows:
prox_v = var - alpha * grad
var = sign(prox_v)/(1+alpha*l2) * max{|prox_v|-alpha*l1,0}
	
SparseApplyRMSProp)
varShould be from a Variable()."T(
msShould be from a Variable()."T)
momShould be from a Variable()."T*
lr!Scaling factor. Must be a scalar."T'
rhoDecay rate. Must be a scalar."T
momentum"T+
epsilonRidge term. Must be a scalar."T
gradThe gradient."TU
indices@A vector of indices into the first dimension of var, ms and mom."Tindices
outSame as "var"."T"
Ttype:
2	"
Tindicestype:
2	"«
use_lockingbool( "If `True`, updating of the var, ms, and mom tensors is protected
by a lock; otherwise the behavior is undefined, but may exhibit less
contention.*1Update '*var' according to the RMSProp algorithm.2ŹNote that in dense implementation of this algorithm, ms and mom will
update even if the grad is zero, but in this sparse implementation, ms
and mom will not update in iterations during which the grad is zero.

mean_square = decay * mean_square + (1-decay) * gradient ** 2
Delta = learning_rate * gradient / sqrt(mean_square + epsilon)

ms <- rho * ms_{t-1} + (1-rho) * grad * grad
mom <- momentum * mom_{t-1} + lr * grad / sqrt(ms + epsilon)
var <- var - mom
ų
SparseConcat;
indices+2-D.  Indices of each input `SparseTensor`.	*N>
values.1-D.  Non-empty values of each `SparseTensor`."T*N3
shapes$1-D.  Shapes of each `SparseTensor`.	*NE
output_indices12-D.  Indices of the concatenated `SparseTensor`.	N
output_values:1-D.  Non-empty values of the concatenated `SparseTensor`."TA
output_shape/1-D.  Shape of the concatenated `SparseTensor`.	"

concat_dimint"Dimension to concatenate along. Must be in range [-rank, rank),
where rank is the number of dimensions in each input `SparseTensor`."
Nint(0"	
Ttype*DConcatenates a list of `SparseTensor` along the specified dimension.2į	Concatenation is with respect to the dense versions of these sparse tensors.
It is assumed that each input is a `SparseTensor` whose elements are ordered
along increasing dimension number.

All inputs' shapes must match, except for the concat dimension.  The
`indices`, `values`, and `shapes` lists must have the same length.

The output shape is identical to the inputs', except along the concat
dimension, where it is the sum of the inputs' sizes along that dimension.

The output elements will be resorted to preserve the sort order along
increasing dimension number.

This op runs in `O(M log M)` time, where `M` is the total number of non-empty
values across all inputs. This is due to the need for an internal sort in
order to concatenate efficiently across an arbitrary dimension.

For example, if `concat_dim = 1` and the inputs are

    sp_inputs[0]: shape = [2, 3]
    [0, 2]: "a"
    [1, 0]: "b"
    [1, 1]: "c"

    sp_inputs[1]: shape = [2, 4]
    [0, 1]: "d"
    [0, 2]: "e"

then the output will be

    shape = [2, 7]
    [0, 2]: "a"
    [0, 4]: "d"
    [0, 5]: "e"
    [1, 0]: "b"
    [1, 1]: "c"

Graphically this is equivalent to doing

    [    a] concat [  d e  ] = [    a   d e  ]
    [b c  ]        [       ]   [b c          ]
ź
SparseConditionalAccumulator-
handleThe handle to the accumulator."K
dtypetype"(The type of the value being accumulated.:
2	"(
shapeshape"The shape of the values."
	containerstring "hIf non-empty, this accumulator is placed in the given container.
Otherwise, a default container is used."w
shared_namestring "\If non-empty, this accumulator will be shared under the given name
across multiple sessions.*KA conditional accumulator for aggregating sparse gradients. The accumulator2Öaccepts gradients marked with local_step greater or equal to the most recent
global_step known to the accumulator. The average can be extracted from the
accumulator, provided sufficient gradients have been accumulated. Extracting the
average automatically resets the aggregate to 0, and increments the global_step
recorded by the accumulator.
ż
SparseDenseCwiseAdd

sp_indicesp2-D.  `N x R` matrix with the indices of non-empty values in a
SparseTensor, possibly not in canonical ordering.	I
	sp_values91-D.  `N` non-empty values corresponding to `sp_indices`."T4
sp_shape&1-D.  Shape of the input SparseTensor.	-
dense!`R`-D.  The dense Tensor operand."T7
output*1-D.  The `N` values that are operated on."T"
Ttype:
2	*EAdds up a SparseTensor and a dense Tensor, using these special rules:2(1) Broadcasts the dense side to have the same shape as the sparse side, if
    eligible;
(2) Then, only the dense values pointed to by the indices of the SparseTensor
    participate in the cwise addition.

By these rules, the result is a logical SparseTensor with exactly the same
indices and shape, but possibly with different non-zero values.  The output of
this Op is the resultant non-zero values.
Į
SparseDenseCwiseDiv

sp_indicesp2-D.  `N x R` matrix with the indices of non-empty values in a
SparseTensor, possibly not in canonical ordering.	I
	sp_values91-D.  `N` non-empty values corresponding to `sp_indices`."T4
sp_shape&1-D.  Shape of the input SparseTensor.	-
dense!`R`-D.  The dense Tensor operand."T7
output*1-D.  The `N` values that are operated on."T"
Ttype:
2	*8Component-wise divides a SparseTensor by a dense Tensor.2e*Limitation*: this Op only broadcasts the dense side to the sparse side, but not
the other direction.
Æ
SparseDenseCwiseMul

sp_indicesp2-D.  `N x R` matrix with the indices of non-empty values in a
SparseTensor, possibly not in canonical ordering.	I
	sp_values91-D.  `N` non-empty values corresponding to `sp_indices`."T4
sp_shape&1-D.  Shape of the input SparseTensor.	-
dense!`R`-D.  The dense Tensor operand."T7
output*1-D.  The `N` values that are operated on."T"
Ttype:
2	*;Component-wise multiplies a SparseTensor by a dense Tensor.2ĻThe output locations corresponding to the implicitly zero elements in the sparse
tensor will be zero (i.e., will not take up storage space), regardless of the
contents of the dense tensor (even if it's +/-INF and that INF*0 == NaN).

*Limitation*: this Op only broadcasts the dense side to the sparse side, but not
the other direction.

SparseMatMul
a"Ta
b"Tb
product"
transpose_abool( "
transpose_bbool( "
a_is_sparsebool( "
b_is_sparsebool( "
Tatype0:
2"
Tbtype0:
2*"Multiply matrix "a" by matrix "b".2µThe inputs must be two-dimensional matrices and the inner dimension of "a" must
match the outer dimension of "b". This op is optimized for the case where at
least one of "a" or "b" is sparse. The breakeven for using this versus a dense
matrix multiply on one platform was 30% zero values in the sparse matrix.
¹	
SparseReduceSum
input_indicesp2-D.  `N x R` matrix with the indices of non-empty values in a
SparseTensor, possibly not in canonical ordering.	O
input_values<1-D.  `N` non-empty values corresponding to `input_indices`."T7
input_shape&1-D.  Shape of the input SparseTensor.	J
reduction_axes61-D.  Length-`K` vector containing the reduction axes.*
output`R-K`-D.  The reduced Tensor."T"H
	keep_dimsbool( "1If true, retain reduced dimensions with length 1."
Ttype:
2	*AComputes the sum of elements across dimensions of a SparseTensor.2ńThis Op takes a SparseTensor and is the sparse counterpart to
`tf.reduce_sum()`.  In particular, this Op also returns a dense `Tensor`
instead of a sparse one.

Reduces `sp_input` along the dimensions given in `reduction_axes`.  Unless
`keep_dims` is true, the rank of the tensor is reduced by 1 for each entry in
`reduction_axes`. If `keep_dims` is true, the reduced dimensions are retained
with length 1.

If `reduction_axes` has no entries, all dimensions are reduced, and a tensor
with a single element is returned.  Additionally, the axes can be negative,
which are interpreted according to the indexing rules in Python.
æ	
SparseReduceSumSparse
input_indicesp2-D.  `N x R` matrix with the indices of non-empty values in a
SparseTensor, possibly not in canonical ordering.	O
input_values<1-D.  `N` non-empty values corresponding to `input_indices`."T7
input_shape&1-D.  Shape of the input SparseTensor.	J
reduction_axes61-D.  Length-`K` vector containing the reduction axes.
output_indices	
output_values"T
output_shape	"H
	keep_dimsbool( "1If true, retain reduced dimensions with length 1."
Ttype:
2	*AComputes the sum of elements across dimensions of a SparseTensor.2ćThis Op takes a SparseTensor and is the sparse counterpart to
`tf.reduce_sum()`.  In contrast to SparseReduceSum, this Op returns a
SparseTensor.

Reduces `sp_input` along the dimensions given in `reduction_axes`.  Unless
`keep_dims` is true, the rank of the tensor is reduced by 1 for each entry in
`reduction_axes`. If `keep_dims` is true, the reduced dimensions are retained
with length 1.

If `reduction_axes` has no entries, all dimensions are reduced, and a tensor
with a single element is returned.  Additionally, the axes can be negative,
which are interpreted according to the indexing rules in Python.
ė
SparseReorder
input_indicesp2-D.  `N x R` matrix with the indices of non-empty values in a
SparseTensor, possibly not in canonical ordering.	O
input_values<1-D.  `N` non-empty values corresponding to `input_indices`."T7
input_shape&1-D.  Shape of the input SparseTensor.	u
output_indicesa2-D.  `N x R` matrix with the same indices as input_indices, but
in canonical row-major ordering.	Q
output_values=1-D.  `N` non-empty values corresponding to `output_indices`."T"	
Ttype*?Reorders a SparseTensor into the canonical, row-major ordering.2³Note that by convention, all sparse ops preserve the canonical ordering along
increasing dimension number. The only time ordering can be violated is during
manual manipulation of the indices and values vectors to add entries.

Reordering does not affect the shape of the SparseTensor.

If the tensor has rank `R` and `N` non-empty values, `input_indices` has
shape `[N, R]`, input_values has length `N`, and input_shape has length `R`.

SparseReshapeb
input_indicesO2-D.  `N x R_in` matrix with the indices of non-empty values in a
SparseTensor.	O
input_shape>1-D.  `R_in` vector with the input SparseTensor's dense shape.	G
	new_shape81-D.  `R_out` vector with the requested new dense shape.	u
output_indicesa2-D.  `N x R_out` matrix with the updated indices of non-empty
values in the output SparseTensor.	¤
output_shape1-D.  `R_out` vector with the full dense shape of the output
SparseTensor.  This is the same as `new_shape` but with any -1 dimensions
filled in.	*AReshapes a SparseTensor to represent values in a new dense shape.2©This operation has the same semantics as reshape on the represented dense
tensor.  The `input_indices` are recomputed based on the requested `new_shape`.

If one component of `new_shape` is the special value -1, the size of that
dimension is computed so that the total dense size remains constant.  At
most one component of `new_shape` can be -1.  The number of dense elements
implied by `new_shape` must be the same as the number of dense elements
originally implied by `input_shape`.

Reshaping does not affect the order of values in the SparseTensor.

If the input tensor has rank `R_in` and `N` non-empty values, and `new_shape`
has length `R_out`, then `input_indices` has shape `[N, R_in]`,
`input_shape` has length `R_in`, `output_indices` has shape `[N, R_out]`, and
`output_shape` has length `R_out`.

SparseSegmentMean	
data"T>
indices-A 1-D tensor. Has same rank as `segment_ids`."TidxK
segment_ids:A 1-D tensor. Values should be sorted and can be repeated.g
outputZHas same shape as data, except for dimension 0 which
has size `k`, the number of segments."T"
Ttype:
2"
Tidxtype0:
2	*4Computes the mean along sparse segments of a tensor.2Read [the section on
Segmentation](../../api_docs/python/math_ops.md#segmentation) for an explanation
of segments.

Like `SegmentMean`, but `segment_ids` can have rank less than `data`'s first
dimension, selecting a subset of dimension 0, specified by `indices`.

SparseSegmentMeanGrad;
grad0gradient propagated to the SparseSegmentMean op."TJ
indices9indices passed to the corresponding SparseSegmentMean op."TidxN
segment_ids=segment_ids passed to the corresponding SparseSegmentMean op.F
output_dim05dimension 0 of "data" passed to SparseSegmentMean op.
output"T"
Ttype:
2"
Tidxtype0:
2	*)Computes gradients for SparseSegmentMean.2cReturns tensor "output" with same shape as grad, except for dimension 0 whose
value is output_dim0.
²
SparseSegmentSqrtN	
data"T>
indices-A 1-D tensor. Has same rank as `segment_ids`."TidxK
segment_ids:A 1-D tensor. Values should be sorted and can be repeated.g
outputZHas same shape as data, except for dimension 0 which
has size `k`, the number of segments."T"
Ttype:
2"
Tidxtype0:
2	*LComputes the sum along sparse segments of a tensor divided by the sqrt of N.2N is the size of the segment being reduced.

Read [the section on
Segmentation](../../api_docs/python/math_ops.md#segmentation) for an explanation
of segments.

SparseSegmentSqrtNGrad<
grad1gradient propagated to the SparseSegmentSqrtN op."TK
indices:indices passed to the corresponding SparseSegmentSqrtN op."TidxO
segment_ids>segment_ids passed to the corresponding SparseSegmentSqrtN op.G
output_dim06dimension 0 of "data" passed to SparseSegmentSqrtN op.
output"T"
Ttype:
2"
Tidxtype0:
2	**Computes gradients for SparseSegmentSqrtN.2cReturns tensor "output" with same shape as grad, except for dimension 0 whose
value is output_dim0.
µ	
SparseSegmentSum	
data"T>
indices-A 1-D tensor. Has same rank as `segment_ids`."TidxK
segment_ids:A 1-D tensor. Values should be sorted and can be repeated.g
outputZHas same shape as data, except for dimension 0 which
has size `k`, the number of segments."T"
Ttype:
2		"
Tidxtype0:
2	*3Computes the sum along sparse segments of a tensor.2¶Read [the section on
Segmentation](../../api_docs/python/math_ops.md#segmentation) for an explanation
of segments.

Like `SegmentSum`, but `segment_ids` can have rank less than `data`'s first
dimension, selecting a subset of dimension 0, specified by `indices`.

For example:

```prettyprint
c = tf.constant([[1,2,3,4], [-1,-2,-3,-4], [5,6,7,8]])

# Select two rows, one segment.
tf.sparse_segment_sum(c, tf.constant([0, 1]), tf.constant([0, 0]))
  ==> [[0 0 0 0]]

# Select two rows, two segment.
tf.sparse_segment_sum(c, tf.constant([0, 1]), tf.constant([0, 1]))
  ==> [[ 1  2  3  4]
       [-1 -2 -3 -4]]

# Select all rows, two segments.
tf.sparse_segment_sum(c, tf.constant([0, 1, 2]), tf.constant([0, 0, 1]))
  ==> [[0 0 0 0]
       [5 6 7 8]]

# Which is equivalent to:
tf.segment_sum(c, tf.constant([0, 0, 1]))
```
ī
SparseSoftmaxu

sp_indicese2-D.  `NNZ x R` matrix with the indices of non-empty values in a
SparseTensor, in canonical ordering.	K
	sp_values;1-D.  `NNZ` non-empty values corresponding to `sp_indices`."T4
sp_shape&1-D.  Shape of the input SparseTensor.	B
output51-D.  The `NNZ` values for the result `SparseTensor`."T"
Ttype:
2*0Applies softmax to a batched N-D `SparseTensor`.2ŁThe inputs represent an N-D SparseTensor  with logical shape `[..., B, C]`
(where `N >= 2`), and with indices sorted in the canonical lexicographic order.

This op is equivalent to applying the normal `tf.nn.softmax()` to each innermost
logical submatrix with shape `[B, C]`, but with the catch that *the implicitly
zero elements do not participate*.  Specifically, the algorithm is equivalent
to the following:

  (1) Applies `tf.nn.softmax()` to a densified view of each innermost submatrix
      with shape `[B, C]`, along the size-C dimension;
  (2) Masks out the original implicitly-zero locations;
  (3) Renormalizes the remaining elements.

Hence, the `SparseTensor` result has exactly the same non-zero indices and
shape.
Ź
#SparseSoftmaxCrossEntropyWithLogits.
featuresbatch_size x num_classes matrix"Tv
labelscbatch_size vector with values in [0, num_classes).
This is the label for the given minibatch entry."Tlabels0
loss%Per example loss (batch_size vector)."TJ
backprop;backpropagated gradients (batch_size x num_classes matrix)."T"
Ttype:
2"
Tlabelstype0	:
2	*CComputes softmax cross entropy cost and gradients to backpropagate.2Unlike `SoftmaxCrossEntropyWithLogits`, this operation does not accept
a matrix of label probabilities, but rather a single label per row
of features.  This label is considered to have probability 1.0 for the
given row.

Inputs are the logits, not probabilities.
²
SparseSparseMaximum
	a_indicesu2-D.  `N x R` matrix with the indices of non-empty values in a
SparseTensor, in the canonical lexicographic ordering.	G
a_values81-D.  `N` non-empty values corresponding to `a_indices`."T3
a_shape&1-D.  Shape of the input SparseTensor.	@
	b_indices1counterpart to `a_indices` for the other operand.	Z
b_valuesKcounterpart to `a_values` for the other operand; must be of the same dtype."TZ
b_shapeMcounterpart to `a_shape` for the other operand; the two shapes must be equal.	A
output_indices-2-D.  The indices of the output SparseTensor.	@
output_values,1-D.  The values of the output SparseTensor."T"
Ttype:
2		*2Returns the element-wise max of two SparseTensors.2IAssumes the two SparseTensors have the same shape, i.e., no broadcasting.
·
SparseSparseMinimum
	a_indicesu2-D.  `N x R` matrix with the indices of non-empty values in a
SparseTensor, in the canonical lexicographic ordering.	G
a_values81-D.  `N` non-empty values corresponding to `a_indices`."T3
a_shape&1-D.  Shape of the input SparseTensor.	@
	b_indices1counterpart to `a_indices` for the other operand.	Z
b_valuesKcounterpart to `a_values` for the other operand; must be of the same dtype."TZ
b_shapeMcounterpart to `a_shape` for the other operand; the two shapes must be equal.	A
output_indices-2-D.  The indices of the output SparseTensor.	@
output_values,1-D.  The values of the output SparseTensor."T"
Ttype:
2	*2Returns the element-wise min of two SparseTensors.2IAssumes the two SparseTensors have the same shape, i.e., no broadcasting.
×	
SparseSplitb
	split_dimS0-D.  The dimension along which to split.  Must be in the range
`[0, rank(shape))`.	D
indices72-D tensor represents the indices of the sparse tensor.	C
values61-D tensor represents the values of the sparse tensor."T
shape1-D. tensor represents the shape of the sparse tensor.
output indices: A list of 1-D tensors represents the indices of the output
sparse tensors.	
output_indices	*	num_splith
output_valuesIA list of 1-D tensors represents the values of the output sparse
tensors."T*	num_splite
output_shapeHA list of 1-D tensors represents the shape of the output sparse
tensors.	*	num_split"2
	num_splitint"The number of ways to split.(0"	
Ttype*DSplit a `SparseTensor` into `num_split` tensors along one dimension.2ĆIf the `shape[split_dim]` is not an integer multiple of `num_split`. Slices
`[0 : shape[split_dim] % num_split]` gets one extra dimension.
For example, if `split_dim = 1` and `num_split = 2` and the input is

    input_tensor = shape = [2, 7]
    [    a   d e  ]
    [b c          ]

Graphically the output tensors are:

    output_tensor[0] = shape = [2, 4]
    [    a  ]
    [b c    ]

    output_tensor[1] = shape = [2, 3]
    [ d e  ]
    [      ]
¬
SparseTensorDenseAdd\
	a_indicesE2-D.  The `indices` of the `SparseTensor`, with shape `[nnz, ndims]`."TindicesL
a_values=1-D.  The `values` of the `SparseTensor`, with shape `[nnz]`."TS
a_shape>1-D.  The `shape` of the `SparseTensor`, with shape `[ndims]`."Tindices0
b(`ndims`-D Tensor.  With shape `a_shape`."T
output"T"
Ttype:
2	"
Tindicestype:
2	*JAdds up a `SparseTensor` and a dense `Tensor`, producing a dense `Tensor`.2OThis Op does not require `a_indices` be sorted in standard lexicographic order.
Ø
SparseTensorDenseMatMulQ
	a_indicesB2-D.  The `indices` of the `SparseTensor`, size `[nnz, 2]` Matrix.	M
a_values>1-D.  The `values` of the `SparseTensor`, size `[nnz]` Vector."TH
a_shape;1-D.  The `shape` of the `SparseTensor`, size `[2]` Vector.	
b2-D.  A dense Matrix."T
product"T"	
Ttype"
	adjoint_abool( "xUse the adjoint of A in the matrix multiply.  If A is complex, this
is transpose(conj(A)).  Otherwise it's transpose(A)."
	adjoint_bbool( "xUse the adjoint of B in the matrix multiply.  If B is complex, this
is transpose(conj(B)).  Otherwise it's transpose(B).*:Multiply SparseTensor (of rank 2) "A" by dense matrix "B".2No validity checking is performed on the indices of A.  However, the following
input format is recommended for optimal behavior:

if adjoint_a == false:
  A should be sorted in lexicographically increasing order.  Use SparseReorder
  if you're not sure.
if adjoint_a == true:
  A should be sorted in order of increasing dimension 1 (i.e., "column major"
  order instead of "row major" order).
µ
SparseToDense
sparse_indicesk0-D, 1-D, or 2-D.  `sparse_indices[i]` contains the complete
index where `sparse_values[i]` will be placed."TindicesA
output_shape'1-D.  Shape of the dense output tensor."Tindices
sparse_valuesp1-D.  Values corresponding to each row of `sparse_indices`,
or a scalar value to be used for all sparse indices."TV
default_valueBScalar value to set for indices not specified in
`sparse_indices`."T8
dense,Dense output tensor of shape `output_shape`."T"
validate_indicesbool("oIf true, indices are checked to make sure they are sorted in
lexicographic order and that there are no repeats."	
Ttype"
Tindicestype:
2	*5Converts a sparse representation into a dense tensor.2ŃBuilds an array `dense` with shape `output_shape` such that

```prettyprint
# If sparse_indices is scalar
dense[i] = (i == sparse_indices ? sparse_values : default_value)

# If sparse_indices is a vector, then for each i
dense[sparse_indices[i]] = sparse_values[i]

# If sparse_indices is an n by d matrix, then for each i in [0, n)
dense[sparse_indices[i][0], ..., sparse_indices[i][d-1]] = sparse_values[i]
```

All other values in `dense` are set to `default_value`.  If `sparse_values` is a
scalar, all sparse indices are set to this single value.

Indices should be sorted in lexicographic order, and indices must not
contain any repeats. If `validate_indices` is true, these properties
are checked during execution.
Į
SparseToSparseSetOperationW
set1_indicesE2D `Tensor`, indices of a `SparseTensor`. Must be in row-major
order.	V
set1_valuesD1D `Tensor`, values of a `SparseTensor`. Must be in row-major
order."Tŗ

set1_shape©1D `Tensor`, shape of a `SparseTensor`. `set1_shape[0...n-1]` must
be the same as `set2_shape[0...n-1]`, `set1_shape[n]` is the
max set size across `0...n-1` dimensions.	W
set2_indicesE2D `Tensor`, indices of a `SparseTensor`. Must be in row-major
order.	V
set2_valuesD1D `Tensor`, values of a `SparseTensor`. Must be in row-major
order."Tŗ

set2_shape©1D `Tensor`, shape of a `SparseTensor`. `set2_shape[0...n-1]` must
be the same as `set1_shape[0...n-1]`, `set2_shape[n]` is the
max set size across `0...n-1` dimensions.	3
result_indices2D indices of a `SparseTensor`.	2
result_values1D values of a `SparseTensor`."TŻ
result_shapeŹ1D `Tensor` shape of a `SparseTensor`. `result_shape[0...n-1]` is
the same as the 1st `n-1` dimensions of `set1` and `set2`, `result_shape[n]`
is the max result set size across all `0...n-1` dimensions.	"
set_operationstring"
validate_indicesbool("
Ttype:
	2	*FApplies set operation along last dimension of 2 `SparseTensor` inputs.2ęSee SetOperationOp::SetOperationFromContext for values of `set_operation`.

If `validate_indices` is `True`, `SparseToSparseSetOperation` validates the
order and range of `set1` and `set2` indices.

Input `set1` is a `SparseTensor` represented by `set1_indices`, `set1_values`,
and `set1_shape`. For `set1` ranked `n`, 1st `n-1` dimensions must be the same
as `set2`. Dimension `n` contains values in a set, duplicates are allowed but
ignored.

Input `set2` is a `SparseTensor` represented by `set2_indices`, `set2_values`,
and `set2_shape`. For `set2` ranked `n`, 1st `n-1` dimensions must be the same
as `set1`. Dimension `n` contains values in a set, duplicates are allowed but
ignored.

If `validate_indices` is `True`, this op validates the order and range of `set1`
and `set2` indices.

Output `result` is a `SparseTensor` represented by `result_indices`,
`result_values`, and `result_shape`. For `set1` and `set2` ranked `n`, this
has rank `n` and the same 1st `n-1` dimensions as `set1` and `set2`. The `nth`
dimension contains the result of `set_operation` applied to the corresponding
`[0...n-1]` dimension of `set`.
ō
Splitb
	split_dimS0-D.  The dimension along which to split.  Must be in the range
`[0, rank(value))`. 
valueThe tensor to split."Tø
outputThey are identically shaped tensors, whose shape matches that of `value`
except along `split_dim`, where their sizes are
`values.shape[split_dim] / num_split`."T*	num_split"`
	num_splitint"JThe number of ways to split.  Must evenly divide
`value.shape[split_dim]`.(0"	
Ttype*=Splits a tensor into `num_split` tensors along one dimension.
ē
SplitV 
valueThe tensor to split."TŌ
size_splits¾list containing the sizes of each output tensor along the split
dimension. Must sum to the dimension of value along split_dim.
Can contain one -1 indicating that dimension is to be inferred."Tlenb
	split_dimS0-D.  The dimension along which to split.  Must be in the range
`[0, rank(value))`.
outputmTensors whose shape matches that of `value`
except along `split_dim`, where their sizes are
`size_splits[i]`."T*	num_split"
	num_splitint(0"	
Ttype"
Tlentype0	:
2	*=Splits a tensor into `num_split` tensors along one dimension.
z
Sqrt
x"T
y"T"
Ttype:	
2*'Computes square root of x element-wise.2#I.e., \\(y = \sqrt{x} = x^{1/2}\\).
Ū
SqrtGrad
x"T
y"T
z"T"
Ttype:	
2*8Computes the gradient for the sqrt of `x` wrt its input.2gSpecifically, `grad = dy * 0.5 / y`, where `y = sqrt(x)`, and `dy`
is the corresponding input gradient.
r
Square
x"T
y"T"
Ttype:
	2	*"Computes square of x element-wise.2I.e., \\(y = x * x = x^2\\).
’
SquaredDifference
x"T
y"T
z"T"
Ttype:
	2	*$Returns (x - y)(x - y) element-wise.2*NOTE*: `SquaredDifference` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)
õ
Squeeze#
inputThe `input` to squeeze."Ta
outputTContains the same data as `input`, but has one or more dimensions of
size 1 removed."T"	
Ttype"Ŗ
squeeze_dims	list(int)
 "If specified, only squeezes the dimensions listed. The dimension
index starts at 0. It is an error to squeeze a dimension that is not 1.(*8Removes dimensions of size 1 from the shape of a tensor.2ļGiven a tensor `input`, this operation returns a tensor of the same type with
all dimensions of size 1 removed. If you don't want to remove all size 1
dimensions, you can remove specific size 1 dimensions by specifying
`squeeze_dims`.

For example:

```prettyprint
# 't' is a tensor of shape [1, 2, 1, 3, 1, 1]
shape(squeeze(t)) ==> [2, 3]
```

Or, to remove specific size 1 dimensions:

```prettyprint
# 't' is a tensor of shape [1, 2, 1, 3, 1, 1]
shape(squeeze(t, [2, 4])) ==> [1, 2, 3, 1]
```
Ė
Stack'
handleThe handle to the stack."9
	elem_typetype"&The type of the elements on the stack."

stack_namestring "Overrides the name used for the temporary stack resource. Default
value is the name of the 'Stack' op (which is guaranteed unique).*:A stack that produces elements in first-in last-out order.
b

StackClose%
handleThe handle to a stack.*-Delete the stack from its resource container.
Ż
StackPop%
handleThe handle to a stack.G
elem4The tensor that is popped from the top of the stack."	elem_type"7
	elem_typetype"$The type of the elem that is popped.*(Pop the element at the top of the stack.

	StackPush%
handleThe handle to a stack.2
elem'The tensor to be pushed onto the stack."T1
output$The same tensor as the input 'elem'."T"	
Ttype">
swap_memorybool( "%Swap `elem` to CPU. Default to false.*Push an element onto the stack.
Ż
Stage#
valuesa list of tensors2dtypes"
dtypes
list(type)(0"{
	containerstring "bIf non-empty, this queue is placed in the given container. Otherwise,
a default container is used."Y
shared_namestring ">It is necessary to match this name to the matching Unstage Op.*OStage values similar to a lightweight Enqueue.  The basic functionality of this2iOp is similar to a queue with many fewer capabilities and options.  This Op is
optimized for performance.
	
StopGradient

input"T
output"T"	
Ttype*Stops gradient computation.2¶When executed in a graph, this op outputs its input tensor as-is.

When building ops to compute gradients, this op prevents the contribution of
its inputs to be taken into account.  Normally, the gradient generator adds ops
to a graph to compute the derivatives of a specified 'loss' by recursively
finding out inputs that contributed to its computation.  If you insert this op
in the graph it inputs are masked from the gradient generator.  They are not
taken into account for computing gradients.

This is useful any time you want to compute a value with TensorFlow but need
to pretend that the value was a constant. Some examples include:

*  The *EM* algorithm where the *M-step* should not involve backpropagation
   through the output of the *E-step*.
*  Contrastive divergence training of Boltzmann machines where, when
   differentiating the energy function, the training must not backpropagate
   through the graph that generated the samples from the model.
*  Adversarial training, where no backprop should happen through the adversarial
   example generation process.
š2
StridedSlice

input"T³
begin¢`begin[k]` specifies the offset into the `k`th range specification.
The exact dimension this corresponds to will be determined by context.
Out-of-bounds values will be silently clamped. If the `k`th bit of
`begin_mask` then `begin[k]` is ignored and the full range of the
appropriate dimension is used instead. Negative values causes indexing
to start from the highest element e.g. If `foo==[1,2,3]` then `foo[-1]==3`."Indexk
end]`end[i]` is like `begin` with the exception that `end_mask` is
used to determine full ranges."Index
stridesō`strides[i]` specifies the increment in the `i`th specification
after extracting a given element. Negative indices will reverse
the original order. Out or range values are
clamped to `[0,dim[i]) if slice[i]>0` or `[-1,dim[i]-1] if slice[i] < 0`"Index
output"T"	
Ttype"
Indextype:
2	"ļ

begin_maskint "×a bitmask where a bit i being 1 means to ignore the begin
value and instead use the largest interval possible. At runtime
begin[i] will be replaced with `[0, n-1) if `stride[i] > 0` or
`[-1, n-1]` if `stride[i] < 0`".
end_maskint "analogous to `begin_mask`"ļ
ellipsis_maskint "Ōa bitmask where bit `i` being 1 means the `i`th
position is actually an ellipsis. One bit at most can be 1.
If `ellipsis_mask == 0`, then an implicit ellipsis mask of `1 << (m+1)`
is provided. This means that `foo[3:5] == foo[3:5, ...]`. An ellipsis
implicitly creates as many range specifications as necessary to fully
specify the sliced range for every dimension. For example for a 4-dimensional
tensor `foo` the slice `foo[2, ..., 5:8]` implies `foo[2, :, :, 5:8]`."É
new_axis_maskint "®a bitmask where bit `i` being 1 means the `i`th
specification creates a new shape 1 dimension. For example
`foo[:4, tf.newaxis, :2]` would produce a shape `(4, 1, 2)` tensor."
shrink_axis_maskint "’a bitmask where bit `i` implies that the `i`th
specification should shrink the dimensionality. begin and end
must imply a slice of size 1 in the dimension. For example in
python one might do `foo[:, 3, :]` which would result in
`shrink_axis_mask` being 2.*$Return a strided slice from `input`.2Ń!Note, most python users will want to use the Python `Tensor.__getitem__`
or `Variable.__getitem__` rather than this op directly.

The goal of this op is to produce a new tensor with a subset of
the elements from the `n` dimensional `input` tensor. The subset is chosen using
a sequence of `m` sparse range specifications encoded into the arguments
of this function. Note, in some cases
`m` could be equal to `n`, but this need not be the case. Each
range specification entry can be one of the following:

- An ellipsis (...). Ellipses are used to imply zero or more
  dimensions of full-dimension selection and are produced using
  `ellipsis_mask`. For example, `foo[...]` is the identity slice.

- A new axis. This is used to insert a new shape=1 dimension and is
  produced using `new_axis_mask`. For example, `foo[:, ...]` where
  `foo` is shape `(3, 4)` produces a `(1, 3, 4)` tensor.


- A range `begin:end:stride`. This is used to specify how much to choose from
  a given dimension. `stride` can be any integer but 0.  `begin` is an integer
  which represents the index of the first value to select while `end` represents
  the index of the last value to select. The number of values selected in each
  dimension is `end - begin` if `stride > 0` and `begin - end` if `stride < 0`.
  `begin` and `end` can be negative where `-1` is the last element, `-2` is
  the second to last. `begin_mask` controls whether to replace the explicitly
  given `begin` with an implicit effective value of `0` if `stride > 0` and
  `-1` if `stride < 0`. `end_mask` is analogous but produces the number
  required to create the largest open interval. For example, given a shape
  `(3,)` tensor `foo[:]`, the effective `begin` and `end` are `0` and `3`. Do
  not assume this is equivalent to `foo[0:-1]` which has an effective `begin`
  and `end` of `0` and `2`. Another example is `foo[-2::-1]` which reverses the
  first dimension of a tensor while dropping the last two (in the original
  order elements). For example `foo = [1,2,3,4]; foo[-2::-1]` is `[4,3]`.

- A single index. This is used to keep only elements that have a given
  index. For example (`foo[2, :]` on a shape `(5,6)` tensor produces a
  shape `(6,)` tensor. This is encoded in `begin` and `end` and
  `shrink_axis_mask`.

Each conceptual range specification is encoded in the op's argument. This
encoding is best understand by considering a non-trivial example. In
particular,
`foo[1, 2:4, None, ..., :-3:-1, :]` will be encoded as

```prettyprint
begin = [1, 2, x, x, 0, x] # x denotes don't care (usually 0)
end = [2, 4, x, x, -3, x]
strides = [1, 1, x, x, -1, 1]
begin_mask = 1<<4 | 1 << 5 = 48
end_mask = 1<<5 = 32
ellipsis_mask = 1<<3 = 8
new_axis_mask = 1<<2 4
shrink_axis_mask = 1<<0
```

In this case if `foo.shape` is (5, 5, 5, 5, 5, 5) the final shape of
the slice becomes (2, 1, 5, 5, 2, 5).
Let us walk step by step through each argument specification.

1.  The first argument in the example slice is turned into `begin = 1` and
`end = begin + 1 = 2`. To disambiguate from the original spec `2:4` we
also set the appropriate bit in `shrink_axis_mask`.

2. `2:4` is contributes 2, 4, 1 to begin, end, and stride. All masks have
zero bits contributed.

3. None is a synonym for `tf.newaxis`. This means insert a dimension of size 1
dimension in the final shape. Dummy values are contributed to begin,
end and stride, while the new_axis_mask bit is set.

4. `...` grab the full ranges from as many dimensions as needed to
fully specify a slice for every dimension of the input shape.

5. `:-3:-1` shows the use of negative indices. A negative index `i` associated
with a dimension that has shape `s` is converted to a positive index
`s + i`. So `-1` becomes `s-1` (i.e. the last element). This conversion
is done internally so begin, end and strides receive x, -3, and -1.
The appropriate begin_mask bit is set to indicate the start range is the
full range (ignoring the x).

6. `:` indicates that the entire contents of the corresponding dimension
is selected. This is equivalent to `::` or `0::1`. begin, end, and strides
receive 0, 0, and 1, respectively. The appropriate bits in `begin_mask` and
`end_mask` are also set.

*Requirements*:
  `0 != strides[i] for i in [0, m)`
  `ellipsis_mask must be a power of two (only one ellipsis)`

StridedSliceAssign
ref"T
begin"Index
end"Index
strides"Index

value"T

output_ref"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint *8Assign `value` to the sliced l-value reference of `ref`.2ŅThe values of `value` are assigned to the positions in the variable
`ref` that are selected by the slice parameters. The slice parameters
`begin, `end`, `strides`, etc. work exactly as in `StridedSlice`.

NOTE this op currently does not support broadcasting and so `value`'s
shape must be exactly the shape produced by the slice of `ref`.
µ
StridedSliceGrad
shape"Index
begin"Index
end"Index
strides"Index
dy"T
output"T"	
Ttype"
Indextype:
2	"

begin_maskint "
end_maskint "
ellipsis_maskint "
new_axis_maskint "
shrink_axis_maskint *'Returns the gradient of `StridedSlice`.2Since `StridedSlice` cuts out pieces of its `input` which is size
`shape`, its gradient will have the same shape (which is passed here
as `shape`). The gradient will be zero in any element that the slice
does not select.

Arguments are the same as StridedSliceGrad with the exception that
`dy` is the input gradient to be propagated and `shape` is the
shape of `StridedSlice`'s `input`.
¢

StringJoinø
inputsØA list of string tensors.  The tensors must all have the same shape,
or be scalars.  Scalars may be mixed in; these will be broadcast to the shape
of non-scalar inputs.*N

output"
Nint(0"<
	separatorstring "#string, an optional join separator.*FJoins the strings in the given list of string tensors into one tensor;29with the given separator (default is an empty separator).


StringSplit!
input1-D. Strings to split.B
	delimiter30-D. Delimiter characters (bytes), or empty string.S
indicesFA dense matrix of int64 representing the indices of the sparse tensor.	D
values8A vector of strings corresponding to the splited values.¼
shape°a length-2 vector of int64 representing the shape of the sparse
tensor, where the first value is N and the second value is the maximum number
of tokens in a single input entry.	*ESplit elements of `input` based on `delimiter` into a `SparseTensor`.2õLet N be the size of source (typically N will be the batch size). Split each
element of `input` based on `delimiter` and return a `SparseTensor`
containing the splitted tokens. Empty tokens are ignored.

`delimiter` can be empty, or a string of split characters. If `delimiter` is an
 empty string, each element of `input` is split into individual single-byte
 character strings, including splitting of UTF-8 multibyte sequences. Otherwise
 every character of `delimiter` is a potential split point.

For example:
  N = 2, input[0] is 'hello world' and input[1] is 'a b c', then the output
  will be

  indices = [0, 0;
             0, 1;
             1, 0;
             1, 1;
             1, 2]
  shape = [2, 3]
  values = ['hello', 'world', 'a', 'b', 'c']

StringToHashBucket
string_tensorD
output8A Tensor of the same shape as the input `string_tensor`.	".
num_bucketsint"The number of buckets.(0*PConverts each string in the input Tensor to its hash mod by a number of buckets.2The hash function is deterministic on the content of the string within the
process.

Note that the hash function may change from time to time.
This functionality will be deprecated and it's recommended to use
`tf.string_to_hash_bucket_fast()` or `tf.string_to_hash_bucket_strong()`.
µ
StringToHashBucketFast/
input$The strings to assign a hash bucket.D
output8A Tensor of the same shape as the input `string_tensor`.	".
num_bucketsint"The number of buckets.(0*PConverts each string in the input Tensor to its hash mod by a number of buckets.2”The hash function is deterministic on the content of the string within the
process and will never change. However, it is not suitable for cryptography.
This function may be used when CPU time is scarce and inputs are trusted or
unimportant. There is a risk of adversaries constructing inputs that all hash
to the same bucket. To prevent this problem, use a strong hash function with
`tf.string_to_hash_bucket_strong`.
’
StringToHashBucketStrong/
input$The strings to assign a hash bucket.D
output8A Tensor of the same shape as the input `string_tensor`.	".
num_bucketsint"The number of buckets.(0"^
key	list(int)"LThe key for the keyed hash function passed as a list of two uint64
elements.*PConverts each string in the input Tensor to its hash mod by a number of buckets.2The hash function is deterministic on the content of the string within the
process. The hash function is a keyed hash function, where attribute `key`
defines the key of the hash function. `key` is an array of 2 elements.

A strong hash is important when inputs may be malicious, e.g. URLs with
additional components. Adversaries could try to make their inputs hash to the
same bucket for a denial-of-service attack or to skew the results. A strong
hash prevents this by making it dificult, if not infeasible, to compute inputs
that hash to the same bucket. This comes at a cost of roughly 4x higher compute
time than `tf.string_to_hash_bucket_fast`.
ū
StringToNumber
string_tensorL
output8A Tensor of the same shape as the input `string_tensor`."out_type"^
out_typetype0"@The numeric type to interpret each string in `string_tensor` as.:
2*GConverts each string in the input Tensor to the specified numeric type.2_(Note that int32 overflow results in an error while float overflow
results in a rounded value.)
×
Sub
x"T
y"T
z"T"
Ttype:
	2	*Returns x - y element-wise.2*NOTE*: `Sub` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)

Substr
inputTensor of stringsK
posAScalar defining the position of first character in each substring"TO
lenEScalar defining the number of characters to include in each substring"T 
outputTensor of substrings"
Ttype:
2	*+Return substrings from `Tensor` of strings.2óFor each string in the input `Tensor`, creates a substring starting at index
`pos` with a total length of `len`.

If `len` defines a substring that would extend beyond the length of the input
string, then as many characters as possible are used.

If `pos` is negative or specifies a character index larger than any of the input
strings, then an `InvalidArgumentError` is thrown.

`pos` and `len` must have the same shape, otherwise a `ValueError` is thrown on
Op creation.

*NOTE*: `Substr` supports broadcasting up to two dimensions. More about
broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)

---

Examples

Using scalar `pos` and `len`:

```
input = [b'Hello', b'World']
position = 1
length = 3

output = [b'ell', b'orl']
```

Using `pos` and `len` with same shape as `input`:

```
input = [[b'ten', b'eleven', b'twelve'],
         [b'thirteen', b'fourteen', b'fifteen'],
         [b'sixteen', b'seventeen', b'eighteen']]
position = [[1, 2, 3],
            [1, 2, 3],
            [1, 2, 3]]
length =   [[2, 3, 4],
            [4, 3, 2],
            [5, 5, 5]]

output = [[b'en', b'eve', b'lve'],
          [b'hirt', b'urt', b'te'],
          [b'ixtee', b'vente', b'hteen']]
```

Broadcasting `pos` and `len` onto `input`:

```
input = [[b'ten', b'eleven', b'twelve'],
         [b'thirteen', b'fourteen', b'fifteen'],
         [b'sixteen', b'seventeen', b'eighteen'],
         [b'nineteen', b'twenty', b'twentyone']]
position = [1, 2, 3]
length =   [1, 2, 3]

output = [[b'e', b'ev', b'lve'],
          [b'h', b'ur', b'tee'],
          [b'i', b've', b'hte'],
          [b'i', b'en', b'nty']]
```

Broadcasting `input` onto `pos` and `len`:

```
input = b'thirteen'
position = [1, 5, 7]
length =   [3, 2, 1]

output = [b'hir', b'ee', b'n"]
```
ŗ
Sum!
inputThe tensor to reduce."T4
reduction_indicesThe dimensions to reduce."Tidx 
outputThe reduced tensor."T"H
	keep_dimsbool( "1If true, retain reduced dimensions with length 1."
Ttype:
2	"
Tidxtype0:
2	*;Computes the sum of elements across dimensions of a tensor.2÷Reduces `input` along the dimensions given in `reduction_indices`. Unless
`keep_dims` is true, the rank of the tensor is reduced by 1 for each entry in
`reduction_indices`. If `keep_dims` is true, the reduced dimensions are
retained with length 1.
Ō
Svd
inputA tensor of shape `[..., M, N]` whose inner-most 2 dimensions
form matrices of size `[M, N]`. Let `P` be the minimum of `M` and `N`."T-
s%Singular values. Shape is `[..., P]`."Tŗ
u±Left singular vectors. If `full_matrices` is `False` then shape is
`[..., M, P]`; if `full_matrices` is `True` then shape is
`[..., M, M]`. Undefined if `compute_uv` is `False`."Tø
vÆLeft singular vectors. If `full_matrices` is `False` then shape is
`[..., N, P]`. If `full_matrices` is `True` then shape is `[..., N, N]`.
Undefined if `compute_uv` is false."T"¼

compute_uvbool("£If true, left and right singular vectors will be
computed and returned in `u` and `v`, respectively.
If false, `u` and `v` are not set and should never referenced."Æ
full_matricesbool( "If true, compute full-sized `u` and `v`. If false
(the default), compute only the leading `P` singular vectors.
Ignored if `compute_uv` is `False`."
Ttype:
2*CComputes the singular value decompositions of one or more matrices.2ĘComputes the SVD of each inner matrix in `input` such that
`input[..., :, :] = u[..., :, :] * diag(s[..., :, :]) * transpose(v[..., :, :])`

```prettyprint
# a is a tensor containing a batch of matrices.
# s is a tensor of singular values for each matrix.
# u is the tensor containing of left singular vectors for each matrix.
# v is the tensor containing of right singular vectors for each matrix.
s, u, v = svd(a)
s, _, _ = svd(a, compute_uv=False)
```

Switch@
data5The tensor to be forwarded to the appropriate output."TF
pred<A scalar that specifies which output port will receive data.
M
output_false:If `pred` is false, data will be forwarded to this output."TK
output_true9If `pred` is true, data will be forwarded to this output."T"	
Ttype*8Forwards `data` to the output port determined by `pred`.2If `pred` is true, the `data` input is forwarded to `output_true`. Otherwise,
the data goes to `output_false`.

See also `RefSwitch` and `Merge`.
å
SymbolicGradient4
input&a list of input tensors of size N + M;2Tin3
output#a list of output tensors of size N;2Tout"8
Tin
list(type)"!the type list for the input list.(0"9
Tout
list(type)"!the type list for the input list.(0"¬
ffunc" The function we want to compute the gradient for.

The function 'f' must be a numerical function which takes N inputs and
produces M outputs. Its gradient function 'g', which is computed by
this SymbolicGradient op is a function taking N + M inputs and
produces N outputs.

I.e. if we have
   (y1, y2, ..., y_M) = f(x1, x2, ..., x_N),
then, g is
   (dL/dx1, dL/dx2, ..., dL/dx_N) = g(x1, x2, ..., x_N,
                                     dL/dy1, dL/dy2, ..., dL/dy_M),

where L is a scalar-value function of (x1, x2, ..., xN) (e.g., the
loss function). dL/dx_i is the partial derivative of L with respect
to x_i.

(Needs some math expert to say the comment above better.)*BComputes the gradient function for function f via backpropagation.
Ä
TFRecordReader9
reader_handle#The handle to reference the Reader."|
	containerstring "cIf non-empty, this reader is placed in the given container.
Otherwise, a default container is used."
shared_namestring "wIf non-empty, this reader is named in the given bucket
with this shared_name. Otherwise, the node name is used instead."
compression_typestring *AA Reader that outputs the records from a TensorFlow Records file.
Ć
TFRecordReaderV26
reader_handle#The handle to reference the Reader."|
	containerstring "cIf non-empty, this reader is placed in the given container.
Otherwise, a default container is used."
shared_namestring "wIf non-empty, this reader is named in the given bucket
with this shared_name. Otherwise, the node name is used instead."
compression_typestring *AA Reader that outputs the records from a TensorFlow Records file.
Ä
TakeManySparseFromTensorsMapQ
sparse_handles=1-D, The `N` serialized `SparseTensor` objects.
Shape: `[N]`.	H
sparse_indices42-D.  The `indices` of the minibatch `SparseTensor`.	K
sparse_values31-D.  The `values` of the minibatch `SparseTensor`."dtypeD
sparse_shape21-D.  The `shape` of the minibatch `SparseTensor`.	"Z
dtypetype"KThe `dtype` of the `SparseTensor` objects stored in the
`SparseTensorsMap`."W
	containerstring ">The container name for the `SparseTensorsMap` read by this op."č
shared_namestring "ĢThe shared name for the `SparseTensorsMap` read by this op.
It should not be blank; rather the `shared_name` or unique Operation name
of the Op that created the original `SparseTensorsMap` should be used.*DRead `SparseTensors` from a `SparseTensorsMap` and concatenate them.2The input `sparse_handles` must be an `int64` matrix of shape `[N, 1]` where
`N` is the minibatch size and the rows correspond to the output handles of
`AddSparseToTensorsMap` or `AddManySparseToTensorsMap`.  The ranks of the
original `SparseTensor` objects that went into the given input ops must all
match.  When the final `SparseTensor` is created, it has rank one
higher than the ranks of the incoming `SparseTensor` objects
(they have been concatenated along a new row dimension on the left).

The output `SparseTensor` object's shape values for all dimensions but the
first are the max across the input `SparseTensor` objects' shape values
for the corresponding dimensions.  Its first shape value is `N`, the minibatch
size.

The input `SparseTensor` objects' indices are assumed ordered in
standard lexicographic order.  If this is not the case, after this
step run `SparseReorder` to restore index ordering.

For example, if the handles represent an input, which is a `[2, 3]` matrix
representing two original `SparseTensor` objects:

```
    index = [ 0]
            [10]
            [20]
    values = [1, 2, 3]
    shape = [50]
```

and

```
    index = [ 2]
            [10]
    values = [4, 5]
    shape = [30]
```

then the final `SparseTensor` will be:

```
    index = [0  0]
            [0 10]
            [0 20]
            [1  2]
            [1 10]
    values = [1, 2, 3, 4, 5]
    shape = [2 50]
```
N
Tan
x"T
y"T"
Ttype:
	2	*Computes tan of x element-wise.
^
Tanh
x"T
y"T"
Ttype:	
2*0Computes hyperbolic tangent of `x` element-wise.
Ż
TanhGrad
x"T
y"T
z"T"
Ttype:	
2*8Computes the gradient for the tanh of `x` wrt its input.2iSpecifically, `grad = dy * (1 - y*y)`, where `y = tanh(x)`, and `dy`
is the corresponding input gradient.
Ę
TemporaryVariable4
ref#A reference to the variable tensor."dtype"1
shapeshape"!The shape of the variable tensor.";
dtypetype",The type of elements in the variable tensor."«
var_namestring "Overrides the name used for the temporary variable resource. Default
value is the name of the 'TemporaryVariable' op (which is guaranteed unique).*MReturns a tensor that may be mutated, but only persists within a single step.2This is an experimental op for internal use only and it is possible to use this
op in unsafe ways.  DO NOT USE unless you fully understand the risks.

It is the caller's responsibility to ensure that 'ref' is eventually passed to a
matching 'DestroyTemporaryVariable' op after all other uses have completed.

Outputs a ref to the tensor state so it may be read or modified.

  E.g.
      var = state_ops._temporary_variable([1, 2], types.float_)
      var_name = var.op.name
      var = state_ops.assign(var, [[4.0, 5.0]])
      var = state_ops.assign_add(var, [[6.0, 7.0]])
      final = state_ops._destroy_temporary_variable(var, var_name=var_name)
Ę
TensorArray
size
handle"
dtypetype"
dynamic_sizebool( "
clear_after_readbool("
tensor_array_namestring "
element_shapeshape:BUse TensorArrayV3
=
TensorArrayClose
handleBUse TensorArrayCloseV3
D
TensorArrayCloseV2

handle*"Deprecated. Use TensorArrayCloseV3
õ
TensorArrayCloseV3S
handleGThe handle to a TensorArray (output of TensorArray or TensorArrayGrad).*ADelete the TensorArray from its resource container.  This enables2Gthe user to close and release the resource in the middle of a step/run.

TensorArrayConcat
handle
flow_in
value"dtype
lengths	"
dtypetype"$
element_shape_except0shape:BUse TensorArrayGradV3
„
TensorArrayConcatV2

handle
flow_in
value"dtype
lengths	"
dtypetype"$
element_shape_except0shape:*#Deprecated. Use TensorArrayConcatV3
 
TensorArrayConcatV3(
handleThe handle to a TensorArray.H
flow_in;A float scalar that enforces proper chaining of operations.Z
valueJAll of the elements in the TensorArray, concatenated along the first
axis."dtype”
lengthsA vector of the row sizes of the original T elements in the
value output.  In the example above, this would be the values:
`(n1, n2, ..., n(T-1))`.	"5
dtypetype"&The type of the elem that is returned."ž
element_shape_except0shape:"×The expected shape of an element, if known,
excluding the first dimension. Used to validate the shapes of
TensorArray elements. If this shape is not fully specified, concatenating
zero-size TensorArrays is an error.*<Concat the elements from the TensorArray into value `value`.2Takes `T` elements of shapes

  ```
  (n0 x d0 x d1 x ...), (n1 x d0 x d1 x ...), ..., (n(T-1) x d0 x d1 x ...)
  ```

and concatenates them into a Tensor of shape:

  ```(n0 + n1 + ... + n(T-1) x d0 x d1 x ...)```

All elements must have the same shape (excepting the first dimension).

TensorArrayGather
handle
indices
flow_in
value"dtype"
dtypetype"
element_shapeshape:BUse TensorArrayGatherV3

TensorArrayGatherV2

handle
indices
flow_in
value"dtype"
dtypetype"
element_shapeshape:*#Deprecated. Use TensorArrayGatherV3
Ł
TensorArrayGatherV3(
handleThe handle to a TensorArray.Q
indicesDThe locations in the TensorArray from which to read tensor elements.H
flow_in;A float scalar that enforces proper chaining of operations.l
value\All of the elements in the TensorArray, concatenated along a new
axis (the new dimension 0)."dtype"5
dtypetype"&The type of the elem that is returned."Ó
element_shapeshape:"“The expected shape of an element, if known. Used to
validate the shapes of TensorArray elements. If this shape is not
fully specified, gathering zero-size TensorArrays is an error.*BGather specific elements from the TensorArray into output `value`.2<All elements selected by `indices` must have the same shape.
n
TensorArrayGrad

handle
flow_in
grad_handle"
sourcestringBUse TensorArrayGradV3
u
TensorArrayGradV2

handle
flow_in
grad_handle"
sourcestring*!Deprecated. Use TensorArrayGradV3
ų
TensorArrayGradV32
handle&The handle to the forward TensorArray.H
flow_in;A float scalar that enforces proper chaining of operations.
grad_handle
flow_out"b
sourcestring"PThe gradient source string, used to decide which gradient TensorArray
to return.*NCreates a TensorArray for storing the gradients of values in the given handle.2If the given TensorArray gradient already exists, returns a reference to it.

Locks the size of the original TensorArray by disabling its dynamic size flag.

**A note about the input flow_in:**

The handle flow_in forces the execution of the gradient lookup to occur
only after certain other operations have occurred.  For example, when
the forward TensorArray is dynamically sized, writes to this TensorArray
may resize the object.  The gradient TensorArray is statically sized based
on the size of the forward TensorArray when this operation executes.
Furthermore, the size of the forward TensorArray is frozen by this call.
As a result, the flow is used to ensure that the call to generate the gradient
TensorArray only happens after all writes are executed.

In the case of dynamically sized TensorArrays, gradient computation should
only be performed on read operations that have themselves been chained via
flow to occur only after all writes have executed. That way the final size
of the forward TensorArray is known when this operation is called.

**A note about the source attribute:**

TensorArray gradient calls use an accumulator TensorArray object.  If
multiple gradients are calculated and run in the same session, the multiple
gradient nodes may accidentally flow throuth the same accumulator TensorArray.
This double counts and generally breaks the TensorArray gradient flow.

The solution is to identify which gradient call this particular
TensorArray gradient is being called in.  This is performed by identifying
a unique string (e.g. "gradients", "gradients_1", ...) from the input
gradient Tensor's name.  This string is used as a suffix when creating
the TensorArray gradient object here (the attribute `source`).

The attribute `source` is added as a suffix to the forward TensorArray's
name when performing the creation / lookup, so that each separate gradient
calculation gets its own TensorArray accumulator.

TensorArrayPack
handle
flow_in
value"dtype"
dtypetype"
element_shapeshape:B($Use TensorArrayGatherV3 with RangeOp
r
TensorArrayRead
handle	
index
flow_in
value"dtype"
dtypetypeBUse TensorArrayReadV3
y
TensorArrayReadV2

handle	
index
flow_in
value"dtype"
dtypetype*!Deprecated. Use TensorArrayReadV3
Ć
TensorArrayReadV3(
handleThe handle to a TensorArray.	
indexH
flow_in;A float scalar that enforces proper chaining of operations.=
value-The tensor that is read from the TensorArray."dtype"5
dtypetype"&The type of the elem that is returned.*9Read an element from the TensorArray into output `value`.
}
TensorArrayScatter
handle
indices

value"T
flow_in
flow_out"	
TtypeBUse TensorArrayGradV3

TensorArrayScatterV2

handle
indices

value"T
flow_in
flow_out"	
Ttype*$Deprecated. Use TensorArrayScatterV3
ż
TensorArrayScatterV3(
handleThe handle to a TensorArray.A
indices4The locations at which to write the tensor elements.@
value4The concatenated tensor to write to the TensorArray."TH
flow_in;A float scalar that enforces proper chaining of operations.I
flow_out;A float scalar that enforces proper chaining of operations."	
Ttype*IScatter the data from the input value into specific TensorArray elements.2K`indices` must be a vector, its length must match the first dim of `value`.
R
TensorArraySize
handle
flow_in
sizeBUse TensorArraySizeV3
Y
TensorArraySizeV2

handle
flow_in
size*!Deprecated. Use TensorArraySizeV3

TensorArraySizeV3S
handleGThe handle to a TensorArray (output of TensorArray or TensorArrayGrad).H
flow_in;A float scalar that enforces proper chaining of operations..
size$The current size of the TensorArray.*(Get the current size of the TensorArray.
|
TensorArraySplit
handle

value"T
lengths	
flow_in
flow_out"	
TtypeBUse TensorArraySplitV3

TensorArraySplitV2

handle

value"T
lengths	
flow_in
flow_out"	
Ttype*"Deprecated. Use TensorArraySplitV3
Æ
TensorArraySplitV3(
handleThe handle to a TensorArray.@
value4The concatenated tensor to write to the TensorArray."TX
lengthsKThe vector of lengths, how to split the rows of value into the
TensorArray.	H
flow_in;A float scalar that enforces proper chaining of operations.I
flow_out;A float scalar that enforces proper chaining of operations."	
Ttype*>Split the data from the input value into TensorArray elements.2ņAssuming that `lengths` takes on values

  ```(n0, n1, ..., n(T-1))```

and that `value` has shape

  ```(n0 + n1 + ... + n(T-1) x d0 x d1 x ...)```,

this splits values into a TensorArray with T tensors.

TensorArray index t will be the subtensor of values with starting position

  ```(n0 + n1 + ... + n(t-1), 0, 0, ...)```

and having size

  ```nt x d0 x d1 x ...```

TensorArrayUnpack
handle

value"T
flow_in
flow_out"	
TtypeB)%Use TensorArrayScatterV3 with RangeOp
Ķ
TensorArrayV2
size

handle"
dtypetype"
element_shapeshape:"
dynamic_sizebool( "
clear_after_readbool("
tensor_array_namestring *Deprecated. Use TensorArrayV3

TensorArrayV3 
sizeThe size of the array.*
handleThe handle to the TensorArray.1
flow'A scalar used to control gradient flow."<
dtypetype"-The type of the elements on the tensor_array."Ó
element_shapeshape:"“The expected shape of an element, if known. Used to
validate the shapes of TensorArray elements. If this shape is not
fully specified, gathering zero-size TensorArrays is an error."
dynamic_sizebool( "{A boolean that determines whether writes to the TensorArray
are allowed to grow the size.  By default, this is not allowed."µ
clear_after_readbool("If true (default), Tensors in the TensorArray are cleared
after being read.  This disables multiple read semantics but allows early
release of memory."²
tensor_array_namestring "Overrides the name used for the temporary tensor_array
resource. Default value is the name of the 'TensorArray' op (which
is guaranteed unique).*GAn array of Tensors of given size, with data written via Write and read2via Read or Pack.
z
TensorArrayWrite
handle	
index

value"T
flow_in
flow_out"	
TtypeBUse TensorArrayWriteV3

TensorArrayWriteV2

handle	
index

value"T
flow_in
flow_out"	
Ttype*!Deprecated. Use TensorArrayGradV3
ų
TensorArrayWriteV3(
handleThe handle to a TensorArray.;
index0The position to write to inside the TensorArray.3
value'The tensor to write to the TensorArray."TH
flow_in;A float scalar that enforces proper chaining of operations.I
flow_out;A float scalar that enforces proper chaining of operations."	
Ttype*&Push an element onto the tensor_array.
¬
TensorSummary#
tensorA tensor to serialize."T
summary"	
Ttype"C
descriptionstring "(A json-encoded SummaryDescription proto."6
labelslist(string)
 "An unused list of strings."-
display_namestring "An unused string.*2Outputs a `Summary` protocol buffer with a tensor.
ų
TextLineReader9
reader_handle#The handle to reference the Reader."W
skip_header_linesint "9Number of lines to skip from the beginning of every file."|
	containerstring "cIf non-empty, this reader is placed in the given container.
Otherwise, a default container is used."
shared_namestring "wIf non-empty, this reader is named in the given bucket
with this shared_name. Otherwise, the node name is used instead.*<A Reader that outputs the lines of a file delimited by '\n'.
÷
TextLineReaderV26
reader_handle#The handle to reference the Reader."W
skip_header_linesint "9Number of lines to skip from the beginning of every file."|
	containerstring "cIf non-empty, this reader is placed in the given container.
Otherwise, a default container is used."
shared_namestring "wIf non-empty, this reader is named in the given bucket
with this shared_name. Otherwise, the node name is used instead.*<A Reader that outputs the lines of a file delimited by '\n'.
ß
#ThreadUnsafeUnigramCandidateSampler
true_classesA batch_size * num_true matrix, in which each row contains the
IDs of the num_true target_classes in the corresponding original label.	o
sampled_candidatesWA vector of length num_sampled, in which each element is
the ID of a sampled candidate.	Ģ
true_expected_count²A batch_size * num_true matrix, representing
the number of times each candidate is expected to occur in a batch
of sampled candidates. If unique=true, then this is a probability.ź
sampled_expected_countĶA vector of length num_sampled, for each sampled
candidate representing the number of times the candidate is expected
to occur in a batch of sampled candidates.  If unique=true, then this is a
probability."7
num_trueint""Number of true labels per context.(0"J
num_sampledint"2Number of candidates to randomly sample per batch.(0"Ė
uniquebool"ŗIf unique is true, we sample with rejection, so that all sampled
candidates in a batch are unique. This requires some approximation to
estimate the post-rejection sampling probabilities."X
	range_maxint"BThe sampler will sample integers from the interval [0, range_max).(0"„
seedint "If either seed or seed2 are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."9
seed2int "'An second seed to avoid seed collision.*LGenerates labels for candidate sampling with a learned unigram distribution.2See explanations of candidate sampling and the data formats at
go/candidate-sampling.

For each batch, this op picks a single set of sampled candidate labels.

The advantages of sampling candidates per-batch are simplicity and the
possibility of efficient dense matrix multiplication. The disadvantage is that
the sampled candidates must be chosen independently of the context and of the
true labels.
§
Tile
input1-D or higher."T\
	multiplesC1-D. Length must be the same as the number of dimensions in `input`"
Tmultiples
output"T"	
Ttype"

Tmultiplestype0:
2	*-Constructs a tensor by tiling a given tensor.2½This operation creates a new tensor by replicating `input` `multiples` times.
The output tensor's i'th dimension has `input.dims(i) * multiples[i]` elements,
and the values of `input` are replicated `multiples[i]` times along the 'i'th
dimension. For example, tiling `[a b c d]` by `[2]` produces
`[a b c d a b c d]`.
Ę
TileGrad

input"T
	multiples
output"T"	
Ttype*Returns the gradient of `Tile`.2µSince `Tile` takes an input and repeats the input `multiples` times
along each dimension, `TileGrad` takes in `multiples` and aggregates
each repeated tile of `input` into `output`.B.*TileGrad has been replaced with reduce_sum
¶
TopK;
input/1-D or higher with last dimension at least `k`."TH
values;The `k` largest elements along each last dimensional slice."TJ
indices=The indices of `values` within the last dimension of `input`."f
kint"ZNumber of top elements to look for along the last dimension (along each
row for matrices).("h
sortedbool("TIf true the resulting `k` elements will be sorted by the values in
descending order."
Ttype:
2		*LFinds values and indices of the `k` largest elements for the last dimension.2If the input is a vector (rank-1), finds the `k` largest entries in the vector
and outputs their values and indices as vectors.  Thus `values[j]` is the
`j`-th largest entry in `input`, and its index is `indices[j]`.

For matrices (resp. higher rank input), computes the top `k` entries in each
row (resp. vector along the last dimension).  Thus,

    values.shape = indices.shape = input.shape[:-1] + [k]

If two elements are equal, the lower-index element appears first.

If `k` varies dynamically, use `TopKV2` below.BUse TopKV2 instead
½
TopKV2;
input/1-D or higher with last dimension at least `k`."Tg
k`0-D.  Number of top elements to look for along the last dimension (along each
row for matrices).H
values;The `k` largest elements along each last dimensional slice."TJ
indices=The indices of `values` within the last dimension of `input`."h
sortedbool("TIf true the resulting `k` elements will be sorted by the values in
descending order."
Ttype:
2		*LFinds values and indices of the `k` largest elements for the last dimension.2¤If the input is a vector (rank-1), finds the `k` largest entries in the vector
and outputs their values and indices as vectors.  Thus `values[j]` is the
`j`-th largest entry in `input`, and its index is `indices[j]`.

For matrices (resp. higher rank input), computes the top `k` entries in each
row (resp. vector along the last dimension).  Thus,

    values.shape = indices.shape = input.shape[:-1] + [k]

If two elements are equal, the lower-index element appears first.

This is the same as `TopK`, but takes `k` as in input rather than an attr.

	Transpose
x"T
perm"Tperm
y"T"	
Ttype"
Tpermtype0:
2	*3Shuffle dimensions of x according to a permutation.2The output `y` has the same rank as `x`. The shapes of `x` and `y` satisfy:
  `y.shape[i] == x.shape[perm[i]] for i in [0, 1, ..., rank(x) - 1]`
ó
TruncateDiv
x"T
y"T
z"T"
Ttype:
2	*-Returns x / y element-wise for integer types.2Truncation designates that negative numbers will round fractional quantities
toward zero. I.e. -7 / 5 = 1. This matches C semantics but it is different
than Python semantics. See `FloorDiv` for a division function that matches
Python Semantics.

*NOTE*: `TruncateDiv` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)

TruncateMod
x"T
y"T
z"T"
Ttype:
2	*KReturns element-wise remainder of division. This emulates C semantics where2true, this follows C semantics in that the result here is consistent
with a flooring divide. E.g. `floor(x / y) * y + mod(x, y) = x`.

*NOTE*: `Mod` supports broadcasting. More about broadcasting
[here](http://docs.scipy.org/doc/numpy/user/basics.broadcasting.html)
Ļ
TruncatedNormal+
shapeThe shape of the output tensor."T\
outputKA tensor of the specified shape filled with random truncated normal
values."dtype"©
seedint "If either `seed` or `seed2` are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."8
seed2int "&A second seed to avoid seed collision."/
dtypetype"The type of the output.:
2"
Ttype:
2	*;Outputs random values from a truncated normal distribution.2ĘThe generated values follow a normal distribution with mean 0 and standard
deviation 1, except that values whose magnitude is more than 2 standard
deviations from the mean are dropped and re-picked.
Ė
UniformCandidateSampler
true_classesA batch_size * num_true matrix, in which each row contains the
IDs of the num_true target_classes in the corresponding original label.	o
sampled_candidatesWA vector of length num_sampled, in which each element is
the ID of a sampled candidate.	Ģ
true_expected_count²A batch_size * num_true matrix, representing
the number of times each candidate is expected to occur in a batch
of sampled candidates. If unique=true, then this is a probability.ź
sampled_expected_countĶA vector of length num_sampled, for each sampled
candidate representing the number of times the candidate is expected
to occur in a batch of sampled candidates.  If unique=true, then this is a
probability."7
num_trueint""Number of true labels per context.(0"J
num_sampledint"2Number of candidates to randomly sample per batch.(0"Ė
uniquebool"ŗIf unique is true, we sample with rejection, so that all sampled
candidates in a batch are unique. This requires some approximation to
estimate the post-rejection sampling probabilities."X
	range_maxint"BThe sampler will sample integers from the interval [0, range_max).(0"„
seedint "If either seed or seed2 are set to be non-zero, the random number
generator is seeded by the given seed.  Otherwise, it is seeded by a
random seed."9
seed2int "'An second seed to avoid seed collision.*DGenerates labels for candidate sampling with a uniform distribution.2See explanations of candidate sampling and the data formats at
go/candidate-sampling.

For each batch, this op picks a single set of sampled candidate labels.

The advantages of sampling candidates per-batch are simplicity and the
possibility of efficient dense matrix multiplication. The disadvantage is that
the sampled candidates must be chosen independently of the context and of the
true labels.
ō
Unique
x1-D."T
y1-D."T
idx1-D."out_idx"	
Ttype"
out_idxtype0:
2	*&Finds unique elements in a 1-D tensor.2ēThis operation returns a tensor `y` containing all of the unique elements of `x`
sorted in the same order that they occur in `x`. This operation also returns a
tensor `idx` the same size as `x` that contains the index of each value of `x`
in the unique output `y`. In other words:

`y[idx[i]] = x[i] for i in [0, 1,...,rank(x) - 1]`

For example:

```prettyprint
# tensor 'x' is [1, 1, 2, 4, 4, 4, 7, 8, 8]
y, idx = unique(x)
y ==> [1, 2, 4, 7, 8]
idx ==> [0, 0, 1, 2, 2, 2, 3, 4, 4]
```
„
UniqueWithCounts
x1-D."T
y1-D."T
idx1-D."out_idx
count1-D."out_idx"	
Ttype"
out_idxtype0:
2	*&Finds unique elements in a 1-D tensor.2öThis operation returns a tensor `y` containing all of the unique elements of `x`
sorted in the same order that they occur in `x`. This operation also returns a
tensor `idx` the same size as `x` that contains the index of each value of `x`
in the unique output `y`. Finally, it returns a third tensor `count` that
contains the count of each element of `y` in `x`. In other words:

`y[idx[i]] = x[i] for i in [0, 1,...,rank(x) - 1]`

For example:

```prettyprint
# tensor 'x' is [1, 1, 2, 4, 4, 4, 7, 8, 8]
y, idx, count = unique_with_counts(x)
y ==> [1, 2, 4, 7, 8]
idx ==> [0, 0, 1, 2, 2, 2, 3, 4, 4]
count ==> [2, 1, 3, 1, 2]
```
ņ
UnpackE
value91-D or higher, with `axis` dimension size equal to `num`."T<
output*The list of tensors unpacked from `value`."T*num"
numint("	
Ttype"p
axisint "_Dimension along which to unpack.  Negative values wrap around, so the
valid range is `[-R, R)`.*OUnpacks a given dimension of a rank-`R` tensor into `num` rank-`(R-1)` tensors.2Unpacks `num` tensors from `value` by chipping it along the `axis` dimension.
For example, given a tensor of shape `(A, B, C, D)`;

If `axis == 0` then the i'th tensor in `output` is the slice `value[i, :, :, :]`
  and each tensor in `output` will have shape `(B, C, D)`. (Note that the
  dimension unpacked along is gone, unlike `split`).

If `axis == 1` then the i'th tensor in `output` is the slice `value[:, i, :, :]`
  and each tensor in `output` will have shape `(A, C, D)`.
Etc.

This is the opposite of `pack`.

UnsortedSegmentSum	
data"TJ
segment_ids1A tensor whose shape is a prefix of `data.shape`."Tindices
num_segments£
outputHas same shape as data, except for the first `segment_ids.rank`
dimensions, which are replaced with a single dimension which has size
`num_segments`."T"
Ttype:
2	"
Tindicestype:
2	*,Computes the sum along segments of a tensor.2Read [the section on
Segmentation](../../api_docs/python/math_ops.md#segmentation) for an explanation
of segments.

Computes a tensor such that
`(output[i] = sum_{j...} data[j...]` where the sum is over tuples `j...` such
that `segment_ids[j...] == i`.  Unlike `SegmentSum`, `segment_ids`
need not be sorted and need not cover all values in the full
range of valid values.

If the sum is empty for a given segment ID `i`, `output[i] = 0`.

`num_segments` should equal the number of distinct segment IDs.

<div style="width:70%; margin:auto; margin-bottom:10px; margin-top:20px;">
<img style="width:100%" src="../../images/UnsortedSegmentSum.png" alt>
</div>

Unstage
values2dtypes"
dtypes
list(type)(0"
	containerstring "
shared_namestring *MOp is similar to a lightweight Dequeue.  The basic funtionality is similar to2Xdequeue with many fewer capabilities and options.  This Op is optimized for
performance.

Variable
ref"dtype"
shapeshape"
dtypetype"
	containerstring "
shared_namestring *Use VariableV2 instead.
²

VariableV24
ref#A reference to the variable tensor."dtype"1
shapeshape"!The shape of the variable tensor.";
dtypetype",The type of elements in the variable tensor."~
	containerstring "eIf non-empty, this variable is placed in the given container.
Otherwise, a default container is used."
shared_namestring "yIf non-empty, this variable is named in the given bucket
with this shared_name. Otherwise, the node name is used instead.*?Holds state in the form of a tensor that persists across steps.2¢Outputs a ref to the tensor state so it may be read or modified.
TODO(zhifengc/mrry): Adds a pointer to a more detail document
about sharing states in tensorflow.
ó	
Where	
input
	
index	*5Returns locations of true values in a boolean tensor.2	This operation returns the coordinates of true elements in `input`. The
coordinates are returned in a 2-D tensor where the first dimension (rows)
represents the number of true elements, and the second dimension (columns)
represents the coordinates of the true elements. Keep in mind, the shape of
the output tensor can vary depending on how many true values there are in
`input`. Indices are output in row-major order.

For example:

```prettyprint
# 'input' tensor is [[True, False]
#                    [True, False]]
# 'input' has two true values, so output has two coordinates.
# 'input' has rank of 2, so coordinates have two indices.
where(input) ==> [[0, 0],
                  [1, 0]]

# `input` tensor is [[[True, False]
#                     [True, False]]
#                    [[False, True]
#                     [False, True]]
#                    [[False, False]
#                     [False, True]]]
# 'input' has 5 true values, so output has 5 coordinates.
# 'input' has rank of 3, so coordinates have three indices.
where(input) ==> [[0, 0, 0],
                  [0, 1, 0],
                  [1, 0, 1],
                  [1, 1, 1],
                  [2, 1, 1]]
```
¤
WholeFileReader9
reader_handle#The handle to reference the Reader."|
	containerstring "cIf non-empty, this reader is placed in the given container.
Otherwise, a default container is used."
shared_namestring "wIf non-empty, this reader is named in the given bucket
with this shared_name. Otherwise, the node name is used instead.*?A Reader that outputs the entire contents of a file as a value.2To use, enqueue filenames in a Queue.  The output of ReaderRead will
be a filename (key) and the contents of that file (value).
£
WholeFileReaderV26
reader_handle#The handle to reference the Reader."|
	containerstring "cIf non-empty, this reader is placed in the given container.
Otherwise, a default container is used."
shared_namestring "wIf non-empty, this reader is named in the given bucket
with this shared_name. Otherwise, the node name is used instead.*?A Reader that outputs the entire contents of a file as a value.2To use, enqueue filenames in a Queue.  The output of ReaderRead will
be a filename (key) and the contents of that file (value).
ź
	WriteFileJ
filename<scalar. The name of the file to which we write the contents.C
contents5scalar. The content to be written to the output file.*LWrites contents to the file at input filename. Creates file if not existing.
ŗ
	ZerosLike
xa tensor of type T."TG
y?a tensor of the same shape and type as x but filled with zeros."T"	
Ttype*<Returns a tensor of zeros with the same shape and type as x.
É
Zeta
x"T
q"T
z"T"
Ttype:
2*4Compute the Hurwitz zeta function \\(\zeta(x, q)\\).2`The Hurwitz zeta function is defined as:

```
\zeta(x, q) = \sum_{n=0}^{\infty} (q + n)^{-x}
```