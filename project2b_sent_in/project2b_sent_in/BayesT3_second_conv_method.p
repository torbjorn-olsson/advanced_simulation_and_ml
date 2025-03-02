���U     �GPy.models.gp_regression��GPRegression���)��}�(�_name��GP regression��
_update_on���_index_operations��collections��OrderedDict���)R�(�constraints��paramz.core.index_operations��ParameterIndexOperations���)��}��_properties��paramz.core.lists_and_dicts��IntArrayDict���h�intarray_default_factory�����R�(�paramz.transformations��Logexp���)���numpy.core.multiarray��_reconstruct����numpy��ndarray���K ��Cb���R�(KK��h"�dtype����i8�����R�(K�<�NNNJ����J����K t�b�C                              �t�b�fixed�h!h$K ��h&��R�(KK ��h.�C �t�busb�priors�h)��}�hhh��R�(� GPy.core.parameterization.priors��Gamma���)��G@       G?�      ��bh!h$K ��h&��R�(KK��h.�C       �t�bhA)��G@       G?���������bh!h$K ��h&��R�(KK��h.�C        �t�busbu�_default_constraint_�N�_optimizer_copy_transformed���
parameters�h�	ArrayList���)��(�GPy.kern.src.add��Add���)��}�(h�sum�h�hh)R�(hh�ParameterIndexOperationsView���)��]�(hK Kebh:h`)��]�(h;K KebuhRNhS�hThV)��(�GPy.kern.src.rbf��RBF���)��}�(�use_invLengthscale���_all_dims_active�h!h$K ��h&��R�(KK��h.�C               �t�bh�rbf�h�hh)R�(hh`)��]�(hK Kebh:h`)��]�(h;K KebuhRNhS�hThV)��(h!�GPy.core.parameterization.param��Param���K ��h&��R�(KK��h+�f8�����R�(Kh/NNNJ����J����K t�b�C��D�8�?�t�}�(h��_parent_�hi�_parent_index_�K hRh�_current_slice_��builtins��slice���NKN��R����_realshape_�K���
_realsize_�K�
_realndim_�K�
_original_�hh�variance��	_in_init_��hh)R�(hh`)��]�(hK Kebh:h`)��]�(h;K KebuhS�hThV)���_added_names_����_Parameterizable__visited���_default_prior_�N�_model_initialized_��u��bh!h|K ��h&��R�(KK��h��C.��*g�?�t�}�(h�h�hih�KhRhh�h�NKN��R���h�K��h�Kh�Kh�h�h�lengthscale�h��hh)R�(hh`)��]�(hKKebh:h`)��]�(h;KKebuhS�hThV)��h���h��h�Nh��u��beh���h��h�N�size�K�_param_slices_�]�(h�K KN��R�h�KKN��R�e�	input_dim�K�active_dims�h!h$K ��h&��R�(KK��h.�C               �t�b�	_sliced_X�K �useGPU���psicomp��GPy.kern.src.psi_comp��PSICOMP_RBF���)��}�hS�sb�ARD��h�h�h�hh��h���__doc__�X�  
    Radial Basis Function kernel, aka squared-exponential, exponentiated quadratic or Gaussian kernel:

    .. math::

       k(r) = \sigma^2 \exp \bigg(- \frac{1}{2} r^2 \bigg)

    Inherited from Stationary: 

    Stationary kernels (covariance functions).

    Stationary covariance fucntion depend only on r, where r is defined as

    .. math::
        r(x, x') = \sqrt{ \sum_{q=1}^Q (x_q - x'_q)^2 }

    The covariance function k(x, x' can then be written k(r).

    In this implementation, r is scaled by the lengthscales parameter(s):

    .. math::

        r(x, x') = \sqrt{ \sum_{q=1}^Q \frac{(x_q - x'_q)^2}{\ell_q^2} }.

    By default, there's only one lengthscale: seaprate lengthscales for each
    dimension can be enables by setting ARD=True.

    To implement a stationary covariance function using this class, one need
    only define the covariance function k(r), and it derivative.

    ```
    def K_of_r(self, r):
        return foo
    def dK_dr(self, r):
        return bar
    ```

    The lengthscale(s) and variance parameters are added to the structure automatically.

    Thanks to @strongh:
    In Stationary, a covariance function is defined in GPy as stationary when it depends only on the l2-norm |x_1 - x_2 |.
    However this is the typical definition of isotropy, while stationarity is usually a bit more relaxed.
    The more common version of stationarity is that the covariance is a function of x_1 - x_2 (See e.g. R&W first paragraph of section 4.1).
    
Inherited from Parameterized: 

    Parameterized class

    Say m is a handle to a parameterized class.

    Printing parameters:

        - print m:           prints a nice summary over all parameters
        - print m.name:      prints details for param with name 'name'
        - print m[regexp]: prints details for all the parameters
                             which match (!) regexp
        - print m['']:       prints details for all parameters

        Fields:

            Name:       The name of the param, can be renamed!
            Value:      Shape or value, if one-valued
            Constrain:  constraint of the param, curly "{c}" brackets indicate
                        some parameters are constrained by c. See detailed print
                        to get exact constraints.
            Tied_to:    which paramter it is tied to.

    Getting and setting parameters:

        Set all values in param to one:

            m.name.to.param = 1

    Handling of constraining, fixing and tieing parameters:

        You can constrain parameters by calling the constrain on the param itself, e.g:

            - m.name[:,1].constrain_positive()
            - m.name[0].tie_to(m.name[1])

        Fixing parameters will fix them to the value they are right now. If you change
        the parameters value, the param will be fixed to the new value!

        If you want to operate on all parameters use m[''] to wildcard select all paramters
        and concatenate them. Printing m[''] will result in printing of all parameters in detail.
    
Inherited from Parameterized: 

    Say m is a handle to a parameterized class.

    Printing parameters::

        - print m:           prints a nice summary over all parameters
        - print m.name:      prints details for param with name 'name'
        - print m[regexp]: prints details for all the parameters
                             which match (!) regexp
        - print m['']:       prints details for all parameters

    Fields::

        Name:       The name of the param, can be renamed!
        Value:      Shape or value, if one-valued
        Constrain:  constraint of the param, curly "{c}" brackets indicate
                    some parameters are constrained by c. See detailed print
                    to get exact constraints.
        Tied_to:    which paramter it is tied to.

    Getting and setting parameters::

        - Set all values in param to one:      m.name.to.param = 1
        - Set all values in parameterized:     m.name[:] = 1
        - Set values to random values:         m[:] = np.random.norm(m.size)

    Handling of constraining, fixing and tieing parameters::

         - You can constrain parameters by calling the constrain on the param itself, e.g:

            - m.name[:,1].constrain_positive()
            - m.name[0].tie_to(m.name[1])

         - Fixing parameters will fix them to the value they are right now. If you change
           the parameters value, the param will be fixed to the new value!

         - If you want to operate on all parameters use m[''] to wildcard select all paramters
           and concatenate them. Printing m[''] will result in printing of all parameters in detail.
    
Inherited from Parameterizable: 

    A parameterisable class.

    This class provides the parameters list (ArrayList) and standard parameter handling,
    such as {link|unlink}_parameter(), traverse hierarchy and param_array, gradient_array
    and the empty parameters_changed().

    This class is abstract and should not be instantiated.
    Use paramz.Parameterized() as node (or leaf) in the parameterized hierarchy.
    Use paramz.Param() for a leaf in the parameterized hierarchy.
    
Inherited from OptimizationHandlable: 

    This enables optimization handles on an Object as done in GPy 0.4.

    `..._optimizer_copy_transformed`: make sure the transformations and constraints etc are handled
    
Inherited from Indexable: 

    Make an object constrainable with Priors and Transformations.

    TODO: Mappings!! (As in ties etc.)

    Adding a constraint to a Parameter means to tell the highest parent that
    the constraint was added and making sure that all parameters covered
    by this object are indeed conforming to the constraint.

    :func:`constrain()` and :func:`unconstrain()` are main methods here
    
Inherited from Nameable: 

    Make an object nameable inside the hierarchy.
    
Inherited from Gradcheckable: 

    Adds the functionality for an object to be gradcheckable.
    It is just a thin wrapper of a call to the highest parent for now.
    TODO: Can be done better, by only changing parameters of the current parameter handle,
    such that object hierarchy only has to change for those.
    
Inherited from Pickleable: 

    Make an object pickleable (See python doc 'pickling').

    This class allows for pickling support by Memento pattern.
    _getstate returns a memento of the class, which gets pickled.
    _setstate(<memento>) (re-)sets the state of the class to the memento
    
Inherited from object: 
The base class of the class hierarchy.

When called, it accepts no arguments and returns a new featureless
instance that has no instance attributes and cannot be given any.

Inherited from Parentable: 

    Enable an Object to have a parent.

    Additionally this adds the parent_index, which is the index for the parent
    to look for in its parameter list.
    
Inherited from Updateable: 

    A model can be updated or not.
    Make sure updates can be switched on and off.
    
Inherited from Observable: 

    Observable pattern for parameterization.

    This Object allows for observers to register with self and a (bound!) function
    as an observer. Every time the observable changes, it sends a notification with
    self as only argument to all its observers.
    
�h�K h�h[ub�GPy.kern.src.static��Bias���)��}�(hlh!h$K ��h&��R�(KK��h.�C               �t�bh�bias�h�hh)R�(hh`)��]�(hKKebh:h`)��]�(h;KKebuhRNhS�hThV)��h!h|K ��h&��R�(KK��h��C���*p�?�t�}�(h�h�h�h�K hRhh�h�NKN��R���h�K��h�Kh�Kh�h�hh�h��hh)R�(hh`)��]�(hKKebh:h`)��]�(h;KKebuhS�hThV)��h���h��h�Nh��u��bah���h��h�Nh�Kh�]�h�K KN��R�ah�Kh�h!h$K ��h&��R�(KK��h.�C               �t�bh�K hɉhʌGPy.kern.src.psi_comp.gaussherm��
PSICOMP_GH���)��}�(�degree�K�cache_K���locs�h!h$K ��h&��R�(KK��h��CX/1�d��� �	�D}�������sL=�����yK���        ���yK��?�sL=�?����@ �	�D}@/1�d��@�t�b�weights�h!h$K ��h&��R�(KK��h��CXB��@�> ��)?�Ժ�{?��_x�? ����?��^ c��? ����?��_x�?�Ժ�{? ��)?B��@�>�t�b�Xs�NhS�ubh�h�h��h��h�X�  Inherited from Parameterized: 

    Parameterized class

    Say m is a handle to a parameterized class.

    Printing parameters:

        - print m:           prints a nice summary over all parameters
        - print m.name:      prints details for param with name 'name'
        - print m[regexp]: prints details for all the parameters
                             which match (!) regexp
        - print m['']:       prints details for all parameters

        Fields:

            Name:       The name of the param, can be renamed!
            Value:      Shape or value, if one-valued
            Constrain:  constraint of the param, curly "{c}" brackets indicate
                        some parameters are constrained by c. See detailed print
                        to get exact constraints.
            Tied_to:    which paramter it is tied to.

    Getting and setting parameters:

        Set all values in param to one:

            m.name.to.param = 1

    Handling of constraining, fixing and tieing parameters:

        You can constrain parameters by calling the constrain on the param itself, e.g:

            - m.name[:,1].constrain_positive()
            - m.name[0].tie_to(m.name[1])

        Fixing parameters will fix them to the value they are right now. If you change
        the parameters value, the param will be fixed to the new value!

        If you want to operate on all parameters use m[''] to wildcard select all paramters
        and concatenate them. Printing m[''] will result in printing of all parameters in detail.
    
Inherited from Parameterized: 

    Say m is a handle to a parameterized class.

    Printing parameters::

        - print m:           prints a nice summary over all parameters
        - print m.name:      prints details for param with name 'name'
        - print m[regexp]: prints details for all the parameters
                             which match (!) regexp
        - print m['']:       prints details for all parameters

    Fields::

        Name:       The name of the param, can be renamed!
        Value:      Shape or value, if one-valued
        Constrain:  constraint of the param, curly "{c}" brackets indicate
                    some parameters are constrained by c. See detailed print
                    to get exact constraints.
        Tied_to:    which paramter it is tied to.

    Getting and setting parameters::

        - Set all values in param to one:      m.name.to.param = 1
        - Set all values in parameterized:     m.name[:] = 1
        - Set values to random values:         m[:] = np.random.norm(m.size)

    Handling of constraining, fixing and tieing parameters::

         - You can constrain parameters by calling the constrain on the param itself, e.g:

            - m.name[:,1].constrain_positive()
            - m.name[0].tie_to(m.name[1])

         - Fixing parameters will fix them to the value they are right now. If you change
           the parameters value, the param will be fixed to the new value!

         - If you want to operate on all parameters use m[''] to wildcard select all paramters
           and concatenate them. Printing m[''] will result in printing of all parameters in detail.
    
Inherited from Parameterizable: 

    A parameterisable class.

    This class provides the parameters list (ArrayList) and standard parameter handling,
    such as {link|unlink}_parameter(), traverse hierarchy and param_array, gradient_array
    and the empty parameters_changed().

    This class is abstract and should not be instantiated.
    Use paramz.Parameterized() as node (or leaf) in the parameterized hierarchy.
    Use paramz.Param() for a leaf in the parameterized hierarchy.
    
Inherited from OptimizationHandlable: 

    This enables optimization handles on an Object as done in GPy 0.4.

    `..._optimizer_copy_transformed`: make sure the transformations and constraints etc are handled
    
Inherited from Indexable: 

    Make an object constrainable with Priors and Transformations.

    TODO: Mappings!! (As in ties etc.)

    Adding a constraint to a Parameter means to tell the highest parent that
    the constraint was added and making sure that all parameters covered
    by this object are indeed conforming to the constraint.

    :func:`constrain()` and :func:`unconstrain()` are main methods here
    
Inherited from Nameable: 

    Make an object nameable inside the hierarchy.
    
Inherited from Gradcheckable: 

    Adds the functionality for an object to be gradcheckable.
    It is just a thin wrapper of a call to the highest parent for now.
    TODO: Can be done better, by only changing parameters of the current parameter handle,
    such that object hierarchy only has to change for those.
    
Inherited from Pickleable: 

    Make an object pickleable (See python doc 'pickling').

    This class allows for pickling support by Memento pattern.
    _getstate returns a memento of the class, which gets pickled.
    _setstate(<memento>) (re-)sets the state of the class to the memento
    
Inherited from object: 
The base class of the class hierarchy.

When called, it accepts no arguments and returns a new featureless
instance that has no instance attributes and cannot be given any.

Inherited from Parentable: 

    Enable an Object to have a parent.

    Additionally this adds the parent_index, which is the index for the parent
    to look for in its parameter list.
    
Inherited from Updateable: 

    A model can be updated or not.
    Make sure updates can be switched on and off.
    
Inherited from Observable: 

    Observable pattern for parameterization.

    This Object allows for observers to register with self and a (bound!) function
    as an observer. Every time the observable changes, it sends a notification with
    self as only argument to all its observers.
    
�h�Kh�h[ubeh���(hshސh��h�Nh�Kh�]�(h�K KN��R�h�KKN��R�eh�Kh�h!h$K ��h&��R�(KK��h.�C               �t�bhlh!h$K ��h&��R�(KK��h.�C               �t�bh�K hɉh�j  )��}�(j  Kj  �j	  h!h$K ��h&��R�(KK��h��CX/1�d��� �	�D}�������sL=�����yK���        ���yK��?�sL=�?����@ �	�D}@/1�d��@�t�bj  h!h$K ��h&��R�(KK��h��CXB��@�> ��)?�Ժ�{?��_x�? ����?��^ c��? ����?��_x�?�Ժ�{? ��)?B��@�>�t�bj  Nub�
extra_dims�h!h$K ��h&��R�(KK ��h.�h8t�b�_exact_psicomp��h��h��hshih�h�h�X�  
    Add given list of kernels together.
    propagates gradients through.

    This kernel will take over the active dims of it's subkernels passed in.

    NOTE: The subkernels will be copies of the original kernels, to prevent
    unexpected behavior.
    Inherited from CombinationKernel: 

    Abstract super class for combination kernels.
    A combination kernel combines (a list of) kernels and works on those.
    Examples are the HierarchicalKernel or Add and Prod kernels.
    
Inherited from Parameterized: 

    Parameterized class

    Say m is a handle to a parameterized class.

    Printing parameters:

        - print m:           prints a nice summary over all parameters
        - print m.name:      prints details for param with name 'name'
        - print m[regexp]: prints details for all the parameters
                             which match (!) regexp
        - print m['']:       prints details for all parameters

        Fields:

            Name:       The name of the param, can be renamed!
            Value:      Shape or value, if one-valued
            Constrain:  constraint of the param, curly "{c}" brackets indicate
                        some parameters are constrained by c. See detailed print
                        to get exact constraints.
            Tied_to:    which paramter it is tied to.

    Getting and setting parameters:

        Set all values in param to one:

            m.name.to.param = 1

    Handling of constraining, fixing and tieing parameters:

        You can constrain parameters by calling the constrain on the param itself, e.g:

            - m.name[:,1].constrain_positive()
            - m.name[0].tie_to(m.name[1])

        Fixing parameters will fix them to the value they are right now. If you change
        the parameters value, the param will be fixed to the new value!

        If you want to operate on all parameters use m[''] to wildcard select all paramters
        and concatenate them. Printing m[''] will result in printing of all parameters in detail.
    
Inherited from Parameterized: 

    Say m is a handle to a parameterized class.

    Printing parameters::

        - print m:           prints a nice summary over all parameters
        - print m.name:      prints details for param with name 'name'
        - print m[regexp]: prints details for all the parameters
                             which match (!) regexp
        - print m['']:       prints details for all parameters

    Fields::

        Name:       The name of the param, can be renamed!
        Value:      Shape or value, if one-valued
        Constrain:  constraint of the param, curly "{c}" brackets indicate
                    some parameters are constrained by c. See detailed print
                    to get exact constraints.
        Tied_to:    which paramter it is tied to.

    Getting and setting parameters::

        - Set all values in param to one:      m.name.to.param = 1
        - Set all values in parameterized:     m.name[:] = 1
        - Set values to random values:         m[:] = np.random.norm(m.size)

    Handling of constraining, fixing and tieing parameters::

         - You can constrain parameters by calling the constrain on the param itself, e.g:

            - m.name[:,1].constrain_positive()
            - m.name[0].tie_to(m.name[1])

         - Fixing parameters will fix them to the value they are right now. If you change
           the parameters value, the param will be fixed to the new value!

         - If you want to operate on all parameters use m[''] to wildcard select all paramters
           and concatenate them. Printing m[''] will result in printing of all parameters in detail.
    
Inherited from Parameterizable: 

    A parameterisable class.

    This class provides the parameters list (ArrayList) and standard parameter handling,
    such as {link|unlink}_parameter(), traverse hierarchy and param_array, gradient_array
    and the empty parameters_changed().

    This class is abstract and should not be instantiated.
    Use paramz.Parameterized() as node (or leaf) in the parameterized hierarchy.
    Use paramz.Param() for a leaf in the parameterized hierarchy.
    
Inherited from OptimizationHandlable: 

    This enables optimization handles on an Object as done in GPy 0.4.

    `..._optimizer_copy_transformed`: make sure the transformations and constraints etc are handled
    
Inherited from Indexable: 

    Make an object constrainable with Priors and Transformations.

    TODO: Mappings!! (As in ties etc.)

    Adding a constraint to a Parameter means to tell the highest parent that
    the constraint was added and making sure that all parameters covered
    by this object are indeed conforming to the constraint.

    :func:`constrain()` and :func:`unconstrain()` are main methods here
    
Inherited from Nameable: 

    Make an object nameable inside the hierarchy.
    
Inherited from Gradcheckable: 

    Adds the functionality for an object to be gradcheckable.
    It is just a thin wrapper of a call to the highest parent for now.
    TODO: Can be done better, by only changing parameters of the current parameter handle,
    such that object hierarchy only has to change for those.
    
Inherited from Pickleable: 

    Make an object pickleable (See python doc 'pickling').

    This class allows for pickling support by Memento pattern.
    _getstate returns a memento of the class, which gets pickled.
    _setstate(<memento>) (re-)sets the state of the class to the memento
    
Inherited from object: 
The base class of the class hierarchy.

When called, it accepts no arguments and returns a new featureless
instance that has no instance attributes and cannot be given any.

Inherited from Parentable: 

    Enable an Object to have a parent.

    Additionally this adds the parent_index, which is the index for the parent
    to look for in its parameter list.
    
Inherited from Updateable: 

    A model can be updated or not.
    Make sure updates can be switched on and off.
    
Inherited from Observable: 

    Observable pattern for parameterization.

    This Object allows for observers to register with self and a (bound!) function
    as an observer. Every time the observable changes, it sends a notification with
    self as only argument to all its observers.
    
�h�hh�K ub�GPy.likelihoods.gaussian��Gaussian���)��}�(h�Gaussian_noise�h�hh)R�(hh`)��]�(hKKebh:h`)��]�(h;KKebuhRNhS�hThV)��h!h|K ��h&��R�(KK��h��CG�m��ȧ<�t�}�(h�h�jD  h�K hRhh�h�NKN��R���h�K��h�Kh�Kh�jO  hh�h��hh)R�(hh`)��]�(hKKebh:h`)��]�(h;KKebuhS�hThV)��h���h��h�Nh��u��bah���h��h�Nh�Kh�]�h�K KN��R�a�gp_link��GPy.likelihoods.link_functions��Identity���)���log_concave���not_block_really��h�jO  h��h��h�X�  
    Gaussian likelihood

    .. math::
        \ln p(y_{i}|\lambda(f_{i})) = -\frac{N \ln 2\pi}{2} - \frac{\ln |K|}{2} - \frac{(y_{i} - \lambda(f_{i}))^{T}\sigma^{-2}(y_{i} - \lambda(f_{i}))}{2}

    :param variance: variance value of the Gaussian distribution
    :param N: Number of data points
    :type N: int
    Inherited from Likelihood: 

    Likelihood base class, used to defing p(y|f).

    All instances use _inverse_ link functions, which can be swapped out. It is
    expected that inheriting classes define a default inverse link function

    To use this class, inherit and define missing functionality.

    Inheriting classes *must* implement:
       pdf_link : a bound method which turns the output of the link function into the pdf
       logpdf_link : the logarithm of the above

    To enable use with EP, inheriting classes *must* define:
       TODO: a suitable derivative function for any parameters of the class
    It is also desirable to define:
       moments_match_ep : a function to compute the EP moments If this isn't defined, the moments will be computed using 1D quadrature.

    To enable use with Laplace approximation, inheriting classes *must* define:
       Some derivative functions *AS TODO*

    For exact Gaussian inference, define *JH TODO*

    
Inherited from Parameterized: 

    Parameterized class

    Say m is a handle to a parameterized class.

    Printing parameters:

        - print m:           prints a nice summary over all parameters
        - print m.name:      prints details for param with name 'name'
        - print m[regexp]: prints details for all the parameters
                             which match (!) regexp
        - print m['']:       prints details for all parameters

        Fields:

            Name:       The name of the param, can be renamed!
            Value:      Shape or value, if one-valued
            Constrain:  constraint of the param, curly "{c}" brackets indicate
                        some parameters are constrained by c. See detailed print
                        to get exact constraints.
            Tied_to:    which paramter it is tied to.

    Getting and setting parameters:

        Set all values in param to one:

            m.name.to.param = 1

    Handling of constraining, fixing and tieing parameters:

        You can constrain parameters by calling the constrain on the param itself, e.g:

            - m.name[:,1].constrain_positive()
            - m.name[0].tie_to(m.name[1])

        Fixing parameters will fix them to the value they are right now. If you change
        the parameters value, the param will be fixed to the new value!

        If you want to operate on all parameters use m[''] to wildcard select all paramters
        and concatenate them. Printing m[''] will result in printing of all parameters in detail.
    
Inherited from Parameterized: 

    Say m is a handle to a parameterized class.

    Printing parameters::

        - print m:           prints a nice summary over all parameters
        - print m.name:      prints details for param with name 'name'
        - print m[regexp]: prints details for all the parameters
                             which match (!) regexp
        - print m['']:       prints details for all parameters

    Fields::

        Name:       The name of the param, can be renamed!
        Value:      Shape or value, if one-valued
        Constrain:  constraint of the param, curly "{c}" brackets indicate
                    some parameters are constrained by c. See detailed print
                    to get exact constraints.
        Tied_to:    which paramter it is tied to.

    Getting and setting parameters::

        - Set all values in param to one:      m.name.to.param = 1
        - Set all values in parameterized:     m.name[:] = 1
        - Set values to random values:         m[:] = np.random.norm(m.size)

    Handling of constraining, fixing and tieing parameters::

         - You can constrain parameters by calling the constrain on the param itself, e.g:

            - m.name[:,1].constrain_positive()
            - m.name[0].tie_to(m.name[1])

         - Fixing parameters will fix them to the value they are right now. If you change
           the parameters value, the param will be fixed to the new value!

         - If you want to operate on all parameters use m[''] to wildcard select all paramters
           and concatenate them. Printing m[''] will result in printing of all parameters in detail.
    
Inherited from Parameterizable: 

    A parameterisable class.

    This class provides the parameters list (ArrayList) and standard parameter handling,
    such as {link|unlink}_parameter(), traverse hierarchy and param_array, gradient_array
    and the empty parameters_changed().

    This class is abstract and should not be instantiated.
    Use paramz.Parameterized() as node (or leaf) in the parameterized hierarchy.
    Use paramz.Param() for a leaf in the parameterized hierarchy.
    
Inherited from OptimizationHandlable: 

    This enables optimization handles on an Object as done in GPy 0.4.

    `..._optimizer_copy_transformed`: make sure the transformations and constraints etc are handled
    
Inherited from Indexable: 

    Make an object constrainable with Priors and Transformations.

    TODO: Mappings!! (As in ties etc.)

    Adding a constraint to a Parameter means to tell the highest parent that
    the constraint was added and making sure that all parameters covered
    by this object are indeed conforming to the constraint.

    :func:`constrain()` and :func:`unconstrain()` are main methods here
    
Inherited from Nameable: 

    Make an object nameable inside the hierarchy.
    
Inherited from Gradcheckable: 

    Adds the functionality for an object to be gradcheckable.
    It is just a thin wrapper of a call to the highest parent for now.
    TODO: Can be done better, by only changing parameters of the current parameter handle,
    such that object hierarchy only has to change for those.
    
Inherited from Pickleable: 

    Make an object pickleable (See python doc 'pickling').

    This class allows for pickling support by Memento pattern.
    _getstate returns a memento of the class, which gets pickled.
    _setstate(<memento>) (re-)sets the state of the class to the memento
    
Inherited from object: 
The base class of the class hierarchy.

When called, it accepts no arguments and returns a new featureless
instance that has no instance attributes and cannot be given any.

Inherited from Parentable: 

    Enable an Object to have a parent.

    Additionally this adds the parent_index, which is the index for the parent
    to look for in its parameter list.
    
Inherited from Updateable: 

    A model can be updated or not.
    Make sure updates can be switched on and off.
    
Inherited from Observable: 

    Observable pattern for parameterization.

    This Object allows for observers to register with self and a (bound!) function
    as an observer. Every time the observable changes, it sends a notification with
    self as only argument to all its observers.
    
�h�hh�Kubeh���(jF  h]�h��h�Nh�Kh�]�(h�K KN��R�h�KKN��R�e�optimization_runs�]�(� paramz.optimization.optimization��
opt_lbfgsb���)��}�(�opt_name��L-BFGS-B (Scipy implementation)��messages���f_opt�h�scalar���h�C��.��H����R��x_opt�h!h$K ��h&��R�(KK��h+�f8�����R�(Kh/NNNJ����J����K t�b�C �Ĩ�M	�����Կxur�t�?<�a��@��t�b�
funct_eval�KZ�status��	Converged��
max_f_eval�M��	max_iters�M��bfgs_factor�N�trace�N�time��0:00:00.801483��xtol�N�gtol�N�ftol�Nubjv  )��}�(jy  �L-BFGS-B (Scipy implementation)�j{  �j|  j~  h�Ck�53��H����R�j�  h!h$K ��h&��R�(KK��h+�f8�����R�(Kh/NNNJ����J����K t�b�C 7{ph�L	������Կ�ٶ��u�?������A��t�bj�  K{j�  �	Converged�j�  M�j�  M�j�  Nj�  Nj�  �0:00:00.950255�j�  Nj�  Nj�  Nubjv  )��}�(jy  �L-BFGS-B (Scipy implementation)�j{  �j|  j~  h�CD�(�H@"@���R�j�  h!h$K ��h&��R�(KK��h+�f8�����R�(Kh/NNNJ����J����K t�b�C �!p�H��x�7r��?0m^m�$��i�4	�	��t�bj�  K j�  �	Converged�j�  M�j�  M�j�  Nj�  Nj�  �0:00:00.366394�j�  Nj�  Nj�  Nubjv  )��}�(jy  �L-BFGS-B (Scipy implementation)�j{  �j|  j~  h�C���譼H����R�j�  h!h$K ��h&��R�(KK��h+�f8�����R�(Kh/NNNJ����J����K t�b�C �$(��L	�QN����Կ�M���?ʶ_�S�>��t�bj�  K>j�  �	Converged�j�  M�j�  M�j�  Nj�  Nj�  �0:00:00.582124�j�  Nj�  Nj�  Nubjv  )��}�(jy  �L-BFGS-B (Scipy implementation)�j{  �j|  j~  h�C�� 2��H����R�j�  h!h$K ��h&��R�(KK��h+�f8�����R�(Kh/NNNJ����J����K t�b�C Z:�E�L	��,�T��Կ��mb�?�iB�<cA��t�bj�  Kdj�  �	Converged�j�  M�j�  M�j�  Nj�  Nj�  �0:00:00.862865�j�  Nj�  Nj�  Nubjv  )��}�(jy  �L-BFGS-B (Scipy implementation)�j{  �j|  j~  h�C��w���H����R�j�  h!h$K ��h&��R�(KK��h+�f8�����R�(Kh/NNNJ����J����K t�b�C ��N�L	�N{%��Կ��(v�?'��x>��t�bj�  KYj�  �	Converged�j�  M�j�  M�j�  Nj�  Nj�  �0:00:00.776976�j�  Nj�  Nj�  Nubjv  )��}�(jy  �L-BFGS-B (Scipy implementation)�j{  �j|  j~  h�C���3��H����R�j�  h!h$K ��h&��R�(KK��h+�f8�����R�(Kh/NNNJ����J����K t�b�C �ow8�L	� �t��Կ7d$�t�?�.���B��t�bj�  K{j�  �	Converged�j�  M�j�  M�j�  Nj�  Nj�  �0:00:00.931585�j�  Nj�  Nj�  Nubjv  )��}�(jy  �L-BFGS-B (Scipy implementation)�j{  �j|  j~  h�C� 4��H����R�j�  h!h$K ��h&��R�(KK��h+�f8�����R�(Kh/NNNJ����J����K t�b�C ���/�L	��;���Կ�i�u�?���+B��t�bj�  Ktj�  �#ErrorABNORMAL_TERMINATION_IN_LNSRCH�j�  M�j�  M�j�  Nj�  Nj�  �0:00:00.913892�j�  Nj�  Nj�  Nubjv  )��}�(jy  �L-BFGS-B (Scipy implementation)�j{  �j|  j~  h�Cp��&��H����R�j�  h!h$K ��h&��R�(KK��h+�f8�����R�(Kh/NNNJ����J����K t�b�C ���M	���� �Կ��.��?�s��e@��t�bj�  KFj�  �	Converged�j�  M�j�  M�j�  Nj�  Nj�  �0:00:00.519116�j�  Nj�  Nj�  Nubjv  )��}�(jy  �L-BFGS-B (Scipy implementation)�j{  �j|  j~  h�CЬ�3��H����R�j�  h!h$K ��h&��R�(KK��h+�f8�����R�(Kh/NNNJ����J����K t�b�C O ��L	�
IW���ԿI�!z�?�'8H�A��t�bj�  K&j�  �	Converged�j�  M�j�  M�j�  Nj�  Nj�  �0:00:00.280204�j�  Nj�  Nj�  Nube�sampling_runs�]��preferred_optimizer��lbfgsb��	obj_grads�N�X�h!�paramz.core.observable_array��ObsAr���K ��h&��R�(KK9K��h��B�  �_-���@�O�Σ�?�b���'@��]�2�?S1�5�6_?_�$y���?�|�ɫ$@���0�P�?�9�8�@p 9�*��?�מY�0@��h�x@�מY�0@        [1|���#@��h�x@                        ��h�x@[1|���#@        �מY�0@        �מY�0@��h�x@X)��h+@��h�x@; u��@,@        I�*��@��h�x@���%+u(@+*�����?�מY�0@                        �מY�0@        �gY�o�.@�Hh� �?�ؐ��)@        y`�iY&@"+i���?        �����?L="�=�?������?Dg-��@z:EL�?�s�/c4@        ���%+u@        f��)���?2XDv4�?�����?                ��jr��?ٜR$D�'@        ��6(�$@�9�D��?���V�/@        ��D��(@�fg7�?�מY�0@s�����?�מY�0@s�����?���V�/@��h�x@f��)���?��h�x@; u��@,@�9�D��?��6(�$@��B�=b�?ٜR$D�@V�Da�(@L="�=@��h�x@I�*��+@��E7~ @8���-@��֔��@�ť% @6o��<�@,,,��@        ٜR$D�@        �ť%@        �[�.|\@��B�=b�?,,,��@�9�D��?�[�.|\@������?f��)��
@2XDv4�?���&M	@��B�=b�?���&M	@B�9C_�?f��)��
@c�վ���?���&M	@"+i���?�t�}�h�s��b�
normalizer�N�Y�h!jC  K ��h&��R�(KK9K��h��B�  ���3p��?��V��?�\�����?�K�#��?p�ﺾ�?���k�p�?�4X��p�?���[���?H��p�?X��x�p�?`�x���?�4X��p�?���k�p�?(f�S���?�M�;�?p@�?���?�xjxQ�?�4X��p�?H��p�?�4X��p�?��h��?��ϡVT�?��F�)��?�;0X���?Hm�ݔ�?��³�8�?Xb�?�k�v��?8���<�?�ʜq��?H` n��?�,Mׄ]�?0�m�Ė�?��~H��?���Z�?8�[��?������?�� �H��?�C�{:p�?��I���?�8��n%�?X��d�`�?WXxEM�?hY*��?�֦5���?��6�N�?P�$���?䞆K�A�?��ݵ���? �����?@��op
�?�����?���h��?@6\Q���? �C7-��? �G��?���K��?�t�}�h�s��b�Y_normalized�jP  �
output_dim�K�
Y_metadata�N�kern�h[�
likelihood�jD  �mean_function�N�inference_method��@GPy.inference.latent_function_inference.exact_gaussian_inference��ExactGaussianInference���)���	posterior��1GPy.inference.latent_function_inference.posterior��PosteriorExact���)��}�(�_K�h!h$K ��h&��R�(KK9K9��h��B�e  �N����?���*p�?���*p�?��`�9p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?9V�1p�?���*p�?���*p�?���*p�?���*p�?��\�p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��ʩ��?Hɤ1���?t��S���?���*p�?���*p�?���*p�?���*p�?�颙=��?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���r�?!p�
p�?��R+p�?���*p�?���*p�?��Cp�?G<�*p�?Q��*p�?yO�3p�?e��+p�?��*p�?�]+p�?l��*p�?M��*p�?&��*p�?�C�*p�?���*p�?���*p�?�N����?���*p�?���*p�?���*p�?���*p�?���*p�?~�,p�?���*p�?���*p�?���)p�?���*p�?���*p�?�5\9p�?:��^!p�?���*p�?�.�l{�?���*p�?���*p�?���*p�?��*p�?��_e'��?���V��?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?]����3�?���*p�?E��*p�?(W�$g0�?���*p�?���*p�?���*p�?���*p�?�2��)p�?���*p�?���*p�?���*p�?3��p�?�u�*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�N����?���*p�?�O
p�?���*p�?���*p�?���*p�?t�@�L��?�2�p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?t�@�L��?���*p�?���*p�?���*p�?���*p�?)P�|���?u�7_���?���*p�?���*p�?���*p�?w��sD��?'L�s�y�?�s�ra�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���Gp�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�-�*p�?"o�,p�?G��*p�?���*p�?���*p�?���*p�?w��*p�?�_�+p�?߉�+p�?���*p�?v��+p�?��`�9p�?���*p�?���*p�?�N����?���p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�>�,	p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?-�:p�?���0p�?�45�7u�?���*p�?/��*p�?���*p�?���*p�?�Ԉ�v�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�Wt�r�?�31f�s�?���r�?���*p�?���*p�?���+p�?mW�q�?��Op�?��?�3v�?&J>��{�?+�#c�x�?�1n͈�?�t�Ir�?F�u�p�?wi迴p�?��%4�r�?�N��p�?���*p�?���*p�?�O
p�?���p�?�N����?���*p�?���*p�?���*p�?+�,:p�?�z�Xp�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?+�,:p�?���*p�?���*p�?���*p�?���*p�?�@c4p�?K频Up�?���*p�?���*p�?���*p�?��w@Ht�?7H��?p�?��`�p�?���*p�?)��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�&t]Ap�?���*p�?m��*p�?���*p�?bd5p�?���*p�?���*p�?���*p�?�N*��p�?���~�s�?]���p�?�cm2r�?.bc��?u��y3}�?wT����?"s����?�\���?�_�q��?BqBr��?���*p�?���*p�?���*p�?���*p�?���*p�?�N����?��<p�?���*p�?���*p�?���*p�?���*p�?��<p�?�N����?=�3p�?_��*p�?���*p�?���*p�?��<p�?���*p�?��<p�?��)�@q�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?E 0p�?���*p�?>wRp�?Ĵ*.��?�@9���?���*p�?1�M+p�?���*p�?���*p�?���*p�?�_V=p�?����4p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��<p�?�N����?���*p�?���*p�?���*p�?���*p�?�N����?��<p�?E��*p�??���	p�?���*p�?���*p�?�N����?���*p�?�N����?�NYbp�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�@9���?���*p�?m�%M��?t%b��r�?E 0p�?���*p�?�p�?���*p�?���*p�?���*p�?���*p�?�D�*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?~�,p�?���*p�?���*p�?���*p�?���*p�?���*p�?�N����?���*p�?���*p�?��<p�?���*p�?���*p�?���*p�?���*p�?=�3p�?$��K
p�?���*p�?���*p�?���*p�?���*p�?E��*p�?'�|	p�?���*p�?���*p�?(~H-p�?f.�*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�|p+p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?y��*p�?���*p�?'ҾFgp�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?t�@�L��?���*p�?+�,:p�?���*p�?���*p�?���*p�?�N����?��<p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�N����?���*p�?���*p�?���*p�?���*p�?����p�?�t����?���*p�?���*p�?���*p�?+P6�s�?��7���?L�Xz<�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?E 0p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?=�3p�?9��*p�?X��*p�?�Y�*p�?���*p�?z��*p�?x	
+p�?��:+p�?�7�*p�?�/N+p�?���*p�?���*p�?�2�p�?���*p�?�z�Xp�?���*p�?���*p�?���*p�?��<p�?�N����?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��<p�?���*p�?���*p�?���*p�?���*p�?ɣ����?���p�?���*p�?���*p�?���*p�?)�2\Vr�?�t-p�?!���p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�@9���?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?E��*p�?���*p�?���*p�?h��*p�?8��*p�?���*p�?K<�*p�?���*p�?��*p�?���*p�?9V�1p�?���)p�?���*p�?���*p�?���*p�?���*p�?���*p�?��<p�?���*p�?���*p�?�N����?���*p�?���*p�?���*p�?���*p�?E��*p�?��C/p�?���*p�?���*p�?���*p�?���*p�?=�3p�?�y��z�?���*p�?���*p�?3ʳ]p�?q��7p�?���*p�?���*p�?���*p�?���*p�?i㈞�p�?��*p�?���*p�?�'Z�p�?���*p�?���*p�?���*p�?���*p�?���*p�?N��*p�?���*p�?���*p�?���*p�?���*p�?^O6p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��<p�?�N����?���*p�?���*p�?���*p�?���*p�?�N����?��<p�?E��*p�??���	p�?���*p�?���*p�?�N����?���*p�?�N����?�NYbp�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�@9���?���*p�?m�%M��?t%b��r�?E 0p�?���*p�?�p�?���*p�?���*p�?���*p�?���*p�?�D�*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�N����?��<p�?���*p�?���*p�?���*p�?���*p�?��<p�?�N����?=�3p�?_��*p�?���*p�?���*p�?��<p�?���*p�?��<p�?��)�@q�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?E 0p�?���*p�?>wRp�?Ĵ*.��?�@9���?���*p�?1�M+p�?���*p�?���*p�?���*p�?�_V=p�?����4p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�5\9p�?���*p�?���*p�?���*p�?=�3p�?E��*p�?���*p�?���*p�?���*p�?���*p�?E��*p�?=�3p�?�N����?W��7p�?���*p�?���q�?E��*p�?���*p�?E��*p�?�b�M.p�?E 0p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?f.�*p�?���Fp�?���*p�?�͕+p�?q��7p�?���*p�?�lNp�?���*p�?���*p�?���*p�?|Q���?�|��u��?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?:��^!p�?���*p�?���*p�?���*p�?_��*p�??���	p�?���*p�?���*p�?���*p�?���*p�??���	p�?_��*p�?W��7p�?�N����?���*p�?����p�??���	p�?���*p�??���	p�?�NYbp�?�L����?�/p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�:A�p�?���*p�?K]���r�?T�UI�p�?���p�?�h�.p�?���*p�?���*p�?S�����?���*p�?���*p�?���*p�?V+"1`p�?�rrp�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��\�p�?���*p�?���*p�?�>�,	p�?���*p�?���*p�?���*p�?=�3p�?���*p�?���*p�?E��*p�?���*p�?���*p�?���*p�?���*p�?�N����?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?E�T&mq�?E 0p�?E 0p�?���*p�?���*p�?���*p�?���*p�?�lNp�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?c=Y���?m�$-o��?i㈞�p�?���*p�?���*p�?3�����?���*p�?���*p�?E��*p�?h��*p�?���*p�?�v�*p�?���*p�?���*p�?���*p�?,��*p�?���*p�?���*p�?�.�l{�?���*p�?���*p�?���*p�?���*p�?���*p�?$��K
p�?���*p�?���*p�?��C/p�?���*p�?���*p�?���q�?����p�?���*p�?�N����?���*p�?���*p�?���*p�?K�+p�?Jd��Vp�?�kyOs�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?-�zp�?���*p�?���*p�?��,Vϥ�?���*p�?���*p�?4<�*p�?���*p�?G0��%p�?���*p�?���*p�?���*p�?�`�?�r�?d�Y�p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��<p�?�N����?���*p�?���*p�?���*p�?���*p�?�N����?��<p�?E��*p�??���	p�?���*p�?���*p�?�N����?���*p�?�N����?�NYbp�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�@9���?���*p�?m�%M��?t%b��r�?E 0p�?���*p�?�p�?���*p�?���*p�?���*p�?���*p�?�D�*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?t�@�L��?���*p�?+�,:p�?���*p�?���*p�?���*p�?�N����?��<p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�N����?���*p�?���*p�?���*p�?���*p�?����p�?�t����?���*p�?���*p�?���*p�?+P6�s�?��7���?L�Xz<�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?E 0p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?=�3p�?9��*p�?X��*p�?�Y�*p�?���*p�?z��*p�?x	
+p�?��:+p�?�7�*p�?�/N+p�?���*p�?���*p�?���*p�?���*p�?���*p�?��<p�?�N����?���*p�?���*p�?���*p�?���*p�?�N����?��<p�?E��*p�??���	p�?���*p�?���*p�?�N����?���*p�?�N����?�NYbp�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�@9���?���*p�?m�%M��?t%b��r�?E 0p�?���*p�?�p�?���*p�?���*p�?���*p�?���*p�?�D�*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��*p�?���*p�?���*p�?���*p�?��)�@q�?�NYbp�?���*p�?���*p�?���*p�?���*p�?�NYbp�?��)�@q�?�b�M.p�?�NYbp�?���*p�?K�+p�?�NYbp�?���*p�?�NYbp�?�N����?��1p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?(��*p�?���*p�?n��s�?�/p�?�c��=y�?-��JE��?կdu�}�?���*p�?[�z�z�?���*p�?���*p�?���*p�?����4v�?%�;�{�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��_e'��?���*p�?���*p�?���*p�?���*p�?���*p�?E��*p�?���*p�?���*p�?=�3p�?���*p�?���*p�?E 0p�?�L����?���*p�?Jd��Vp�?���*p�?���*p�?���*p�?��1p�?�N����?,r8i]q�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��7���?���*p�?=�3p�?���u��?���*p�?%��*p�?E��*p�?���*p�?\��9v�?���*p�?���*p�?���*p�?6�p�?;��+p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���V��?���*p�?���*p�?���*p�?���*p�?���*p�?'�|	p�?���*p�?���*p�?�y��z�?���*p�?���*p�?���*p�?�/p�?���*p�?�kyOs�?���*p�?���*p�?���*p�?���*p�?,r8i]q�?�N����?���*p�?���*p�?X��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?*�0��?���*p�?���*p�?���XZ��?���*p�?���*p�?���*p�?���*p�?
:3p�?���*p�?���*p�?���*p�?���-p�?I��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?)P�|���?���*p�?�@c4p�?���*p�?���*p�?���*p�?����p�?ɣ����?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?����p�?���*p�?���*p�?���*p�?���*p�?�N����?��Q�|�?���*p�?���*p�?���*p�?H^�<���?�Xo�-p�?�d�MO��?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��2�s��?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?Y��*p�?�B�*p�?���*p�?P��*p�?�.�*p�?��*p�?sF�*p�?y�+p�?�]�*p�?��*p�?��*p�?���*p�?���*p�?u�7_���?���*p�?K频Up�?���*p�?���*p�?���*p�?�t����?���p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�t����?���*p�?���*p�?���*p�?���*p�?��Q�|�?�N����?���*p�?���*p�?���*p�?������?�?@<��?ַ u�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��w/p�?V�Bp�?��*p�?���+p�?�i�2p�?�fX+p�?iknp�?ҌӜ	p�?��	�	p�?!a�jp�?���	p�?��ʩ��?���*p�?���*p�?-�:p�?���*p�?���*p�?���*p�?(~H-p�?���*p�?���*p�?3ʳ]p�?���*p�?���*p�?���*p�?���*p�?E�T&mq�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?X��*p�?���*p�?���*p�?�N����?�e��Ԍ�?��ġr�?���*p�?���*p�?���*p�?���*p�?�d�aa��?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�9Z\Ǖ�?@�\p�?��8p�?���*p�?���*p�?n#�����?D��*p�?���*p�?��*p�?g��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?Hɤ1���?���*p�?���*p�?���0p�?���*p�?���*p�?���*p�?f.�*p�?���*p�?���*p�?q��7p�?���*p�?���*p�?���*p�?���*p�?E 0p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�e��Ԍ�?�N����?K]���r�?���*p�?���*p�?���*p�?9��*p�?\��9v�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�q?p�?[��+p�?C��*p�?���*p�?���*p�?��~p�?���*p�?���*p�?���*p�?v��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?t��S���?���*p�?���*p�?�45�7u�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?E 0p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��ġr�?K]���r�?�N����?���*p�?���*p�?���*p�?���*p�?�(ݢ��?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?hq�
�p�?<,��	p�?�t-p�?���*p�?���*p�?^O6p�??���	p�?��+p�?q��7p�?���p�?�p�?^�s�p�?�:�Hp�?4+�,p�?|zp.p�?��Ap�?�/p�?���*p�?���*p�?w��sD��?���*p�?��w@Ht�?���*p�?���*p�?���*p�?+P6�s�?)�2\Vr�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?+P6�s�?���*p�?���*p�?���*p�?���*p�?H^�<���?������?���*p�?���*p�?���*p�?�N����?E"-|�?�d���?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?iiBm�w�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?U�o-p�?��>�	p�?c��*p�?��,p�?&�oVp�?
Vl3p�?����p�?+��:p�?
E��p�?�3$	p�?�W�!p�?���*p�?���*p�?'L�s�y�?/��*p�?7H��?p�?���*p�?���*p�?���*p�?��7���?�t-p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��7���?���*p�?���*p�?���*p�?���*p�?�Xo�-p�?�?@<��?���*p�?���*p�?���*p�?E"-|�?�N����?D��-D��?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�'�:p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�??���	p�?i㈞�p�?=�3p�?�,Yp�?�p�?m��/p�?S�Hp�?#$U{p�?wYjbp�?�2�rp�?����p�?���*p�?���*p�?�s�ra�?���*p�?��`�p�?���*p�?���*p�?���*p�?L�Xz<�?!���p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?L�Xz<�?���*p�?���*p�?���*p�?���*p�?�d�MO��?ַ u�?���*p�?���*p�?���*p�?�d���?D��-D��?�N����?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?ךb�
p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?Q�*p�?X�00p�?D��*p�?M��*p�?Ǉ�*p�?��*p�?�*p�?�d�+p�?���+p�?I�*p�?b��+p�?���*p�?]����3�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?i㈞�p�?���*p�?���*p�?���*p�?�:A�p�?���*p�?-�zp�?���*p�?���*p�?���*p�?(��*p�?��7���?*�0��?���*p�?���*p�?���*p�?9��*p�?���*p�?���*p�?���*p�?���*p�?�N����?���*p�?9��*p�?�@08��?���*p�?���*p�?���*p�?���*p�?|�
p�?���*p�?���*p�?���*p�?�8p�?&��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�颙=��?���*p�?���*p�?�Ԉ�v�?)��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��*p�?���*p�?���*p�?���*p�?���*p�?�lNp�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�d�aa��?\��9v�?�(ݢ��?���*p�?���*p�?���*p�?���*p�?�N����?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?ɣ����?�{�	�q�?Ҩ�
p�?���*p�?���*p�?W&�	lp�?y�@-p�?�Y�*p�?�p�?>y^p�?=�3p�?~-�`p�?���+p�?K��*p�?�*p�?��+p�?e��*p�?���*p�?E��*p�?���*p�?���*p�?���*p�?E 0p�?�@9���?���*p�?���*p�?���*p�?���*p�?�@9���?E 0p�?f.�*p�?K]���r�?���*p�?���*p�?�@9���?���*p�?�@9���?n��s�?=�3p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?9��*p�?���*p�?�N����?`��*p�?�d���?ɍ=��p�?��<p�?���*p�?����p�?���*p�?���*p�?���*p�?bp�?�,I1p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?(W�$g0�?���*p�?���*p�?���*p�?���*p�?���*p�?�|p+p�?���*p�?���*p�?�'Z�p�?���*p�?���*p�?���Fp�?T�UI�p�?���*p�?��,Vϥ�?���*p�?���*p�?���*p�?�/p�?���u��?���XZ��?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�@08��?���*p�?`��*p�?�N����?���*p�?���*p�?���*p�?���*p�?Yt��r�?���*p�?���*p�?���*p�?���'q�?���`p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?>wRp�?m�%M��?���*p�?���*p�?���*p�?���*p�?m�%M��?>wRp�?���*p�?���p�?���*p�?���*p�?m�%M��?���*p�?m�%M��?�c��=y�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�d���?���*p�?�N����?m�%M��?�F^p�?���*p�?���	p�?���*p�?���*p�?���*p�?aU�1p�?�.>Mp�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?Ĵ*.��?t%b��r�?���*p�?���*p�?���*p�?���*p�?t%b��r�?Ĵ*.��?�͕+p�?�h�.p�?���*p�?���*p�?t%b��r�?���*p�?t%b��r�?-��JE��?%��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?ɍ=��p�?���*p�?m�%M��?�N����?��2�x�?���*p�?���p�?���*p�?���*p�?���*p�?�Xcp�?���@p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�@9���?E 0p�?���*p�?���*p�?���*p�?���*p�?E 0p�?�@9���?q��7p�?���*p�?���*p�?4<�*p�?E 0p�?���*p�?E 0p�?կdu�}�?E��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��<p�?���*p�?�F^p�?��2�x�?�N����?���*p�? x��p�?���*p�?���*p�?���*p�?��>p�?E���{��?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���Gp�?���*p�?�&t]Ap�?���*p�?���*p�?���*p�?E 0p�?�@9���?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?E 0p�?���*p�?���*p�?���*p�?���*p�?��2�s��?��p�?���*p�?���*p�?���*p�?iiBm�w�?�'�:p�?ךb�
p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�N����?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?C��*p�?f.�*p�?���*p�?���*p�?���*p�?a��*p�?���*p�?��C/p�?���+p�?P�+p�?�Xc+p�?���*p�?�2��)p�?���*p�?���*p�?���*p�?1�M+p�?�p�?���*p�?���*p�?���*p�?���*p�?�p�?1�M+p�?�lNp�?S�����?���*p�?G0��%p�?�p�?���*p�?�p�?[�z�z�?\��9v�?
:3p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?|�
p�?���*p�?����p�?Yt��r�?���	p�?���p�? x��p�?���*p�?�N����?���*p�?���*p�?���*p�?�FyP��?�����p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���r�?���*p�?���*p�?�Wt�r�?m��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?N��*p�?���*p�?���*p�?���*p�?���*p�?c=Y���?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�9Z\Ǖ�?�q?p�?hq�
�p�?���*p�?���*p�?���*p�?���*p�?ɣ����?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�N����?�t����?�R��q�?���*p�?���*p�?�P�8&w�?���*p�?��*p�?̽�+p�?��-p�?�W,p�?���Kp�?��*p�?�@�*p�?sF�*p�?���*p�?ϡ�*p�?!p�
p�?���*p�?���*p�?�31f�s�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?m�$-o��?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?@�\p�?[��+p�?<,��	p�?���*p�?���*p�?���*p�?���*p�?�{�	�q�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�t����?�N����?�FLWu��?���*p�?���*p�?�F(1p�?���*p�?���*p�?[��+p�?�5p�?���Dp�?mJ�(p�?�6g,p�?/��+p�?5+p�?<#�-p�?�+p�?��R+p�?���*p�?���*p�?���r�?bd5p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?i㈞�p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��8p�?C��*p�?�t-p�?���*p�?���*p�?���*p�?���*p�?Ҩ�
p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�R��q�?�FLWu��?�N����?���*p�?���*p�?�/p�?2�@+p�?f.�*p�?�t-p�?��{p�?Ҩ�
p�?��Dp�?0&�`p�?����p�?��>p�?x�O�p�?^O6p�?���*p�?3��p�?���*p�?���*p�?���*p�?�_V=p�?���*p�?y��*p�?���*p�?���*p�?���*p�?���*p�?�_V=p�?|Q���?V+"1`p�?���*p�?�`�?�r�?���*p�?���*p�?���*p�?����4v�?6�p�?���-p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�8p�?���*p�?bp�?���'q�?aU�1p�?�Xcp�?��>p�?���*p�?�FyP��?���*p�?���*p�?���*p�?�N����?<�5Ԉ��?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�u�*p�?���*p�?���*p�?���*p�?����4p�?�D�*p�?���*p�?���*p�?���*p�?���*p�?�D�*p�?����4p�?�|��u��?�rrp�?���*p�?d�Y�p�?�D�*p�?���*p�?�D�*p�?%�;�{�?;��+p�?I��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?&��*p�?���*p�?�,I1p�?���`p�?�.>Mp�?���@p�?E���{��?���*p�?�����p�?���*p�?���*p�?���*p�?<�5Ԉ��?�N����?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��Cp�?���*p�?���*p�?���+p�?���*p�?���*p�?���*p�?'ҾFgp�?���*p�?���*p�?^O6p�?���*p�?���*p�?���*p�?���*p�?3�����?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?n#�����?��~p�?^O6p�?���*p�?���*p�?���*p�?���*p�?W&�	lp�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�P�8&w�?�F(1p�?�/p�?���*p�?���*p�?�N����?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?G<�*p�?���*p�?�-�*p�?mW�q�?�N*��p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?Y��*p�?��w/p�?D��*p�?���*p�??���	p�?U�o-p�??���	p�?Q�*p�?���*p�?y�@-p�?���*p�?���*p�?���*p�?���*p�?���*p�?C��*p�?���*p�?���*p�?���*p�?2�@+p�?���*p�?���*p�?���*p�?�N����?a�;��?ds�ik�?icW�2G�?R�����?��`eG��?�0�����?~=�ɦ�?i�����?ٛ2���?�B���?Q��*p�?���*p�?"o�,p�?��Op�?���~�s�?���*p�?���*p�?���*p�?=�3p�?E��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?=�3p�?���*p�?���*p�?���*p�?���*p�?�B�*p�?V�Bp�?���*p�?���*p�?��+p�?��>�	p�?i㈞�p�?X�00p�?���*p�?�Y�*p�?���*p�?���*p�?���*p�?���*p�?���*p�?f.�*p�?���*p�?��*p�?���*p�?f.�*p�?���*p�?���*p�?���*p�?a�;��?�N����?��7���?H^�<���?PBٰ%��?�R#ޏw�?��$@m��? �ܢ��?�������?<�� s��?���=��?yO�3p�?���*p�?G��*p�?��?�3v�?]���p�?���*p�?���*p�?���*p�?9��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?E��*p�?���*p�?���*p�?9��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��*p�?��*p�?���*p�?q��7p�?c��*p�?=�3p�?D��*p�?���*p�?�p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?̽�+p�?[��+p�?�t-p�?���*p�?���*p�?���*p�?ds�ik�?��7���?�N����?icW�2G�?	�(ݢ��?��`eG��?4�5Ԉ��?��A��?R�,o��?}8L���?�'�!,��?e��+p�?���*p�?���*p�?&J>��{�?�cm2r�?���*p�?���*p�?���*p�?X��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?h��*p�?���*p�?���*p�?X��*p�?���*p�?���*p�?���*p�?���*p�?P��*p�?���+p�?g��*p�?v��*p�?���p�?��,p�?�,Yp�?M��*p�?���*p�?>y^p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��-p�?�5p�?��{p�?���*p�?���*p�?���*p�?icW�2G�?H^�<���?icW�2G�?�N����?P�s��_�?�m�ߨ��?h7E��W�?:k���?�{ϝ
�?c&BtA�?��6�?��*p�?���*p�?���*p�?+�#c�x�?.bc��?���*p�?���*p�?���*p�?�Y�*p�?h��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�Y�*p�?���*p�?���*p�?���*p�?���*p�?�.�*p�?�i�2p�?���*p�?���*p�?�p�?&�oVp�?�p�?Ǉ�*p�?���*p�?=�3p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�W,p�?���Dp�?Ҩ�
p�?���*p�?���*p�?���*p�?R�����?PBٰ%��?	�(ݢ��?P�s��_�?�N����?f{�ik�?Qk���?����'i�?�4
��b�?N��Y(��?k7E��W�?�]+p�?���*p�?���*p�?�1n͈�?u��y3}�?���*p�?���*p�?���*p�?���*p�?8��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�v�*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��*p�?�fX+p�?���*p�?���*p�?^�s�p�?
Vl3p�?m��/p�?��*p�?���*p�?~-�`p�?���*p�?���*p�?���*p�?���*p�?���*p�?a��*p�?���*p�?���Kp�?mJ�(p�?��Dp�?���*p�?���*p�?���*p�?��`eG��?�R#ޏw�?��`eG��?�m�ߨ��?f{�ik�?�N����?+�e�?�DH�y�?.��L��?�_
{�%�?��h����?l��*p�?���*p�?w��*p�?�t�Ir�?wT����?���*p�?���*p�?���*p�?z��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?z��*p�?���*p�?���*p�?���*p�?���*p�?sF�*p�?iknp�?���*p�?���*p�?�:�Hp�?����p�?S�Hp�?�*p�?���*p�?���+p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��*p�?�6g,p�?0&�`p�?���*p�?���*p�?���*p�?�0�����?��$@m��?4�5Ԉ��?h7E��W�?Qk���?+�e�?�N����?ku"d��?����F��?L�*���?����F��?M��*p�?���*p�?�_�+p�?F�u�p�?"s����?���*p�?���*p�?���*p�?x	
+p�?K<�*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?x	
+p�?���*p�?���*p�?���*p�?���*p�?y�+p�?ҌӜ	p�?���*p�?���*p�?4+�,p�?+��:p�?#$U{p�?�d�+p�?���*p�?K��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��C/p�?���*p�?�@�*p�?/��+p�?����p�?���*p�?���*p�?���*p�?~=�ɦ�? �ܢ��?��A��?:k���?����'i�?�DH�y�?ku"d��?�N����?K����?�Z��ӟ�?/�0���?&��*p�?���*p�?߉�+p�?wi迴p�?�\���?���*p�?���*p�?���*p�?��:+p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?��:+p�?���*p�?���*p�?���*p�?���*p�?�]�*p�?��	�	p�?���*p�?���*p�?|zp.p�?
E��p�?wYjbp�?���+p�?���*p�?�*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���+p�?���*p�?sF�*p�?5+p�?��>p�?���*p�?���*p�?���*p�?i�����?�������?R�,o��?�{ϝ
�?�4
��b�?.��L��?����F��?K����?�N����?P��Y(��?~������?�C�*p�?���*p�?���*p�?��%4�r�?�_�q��?���*p�?���*p�?���*p�?�7�*p�?��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?,��*p�?���*p�?���*p�?�7�*p�?���*p�?���*p�?���*p�?���*p�?��*p�?!a�jp�?���*p�?���*p�?��Ap�?�3$	p�?�2�rp�?I�*p�?���*p�?��+p�?���*p�?���*p�?���*p�?���*p�?���*p�?P�+p�?���*p�?���*p�?<#�-p�?x�O�p�?���*p�?���*p�?���*p�?ٛ2���?<�� s��?}8L���?c&BtA�?N��Y(��?�_
{�%�?L�*���?�Z��ӟ�?P��Y(��?�N����?�Z��ӟ�?���*p�?���*p�?v��+p�?�N��p�?BqBr��?���*p�?���*p�?���*p�?�/N+p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�/N+p�?���*p�?���*p�?���*p�?���*p�?��*p�?���	p�?���*p�?���*p�?�/p�?�W�!p�?����p�?b��+p�?���*p�?e��*p�?���*p�?���*p�?���*p�?���*p�?���*p�?�Xc+p�?���*p�?ϡ�*p�?�+p�?^O6p�?���*p�?���*p�?���*p�?�B���?���=��?�'�!,��?��6�?k7E��W�?��h����?����F��?/�0���?~������?�Z��ӟ�?�N����?�t�b�_K_chol�N�_woodbury_chol�h!h$K ��h&��R�(KK9K9��h��B�e  ����?E$3$+<�?E$3$+<�?)�*b<�?E$3$+<�?E$3$+<�?E$3$+<�?�)3$+<�?E$3$+<�?E$3$+<�?,+<�?E$3$+<�?E$3$+<�?E$3$+<�?E$3$+<�?6�E	,<�?E$3$+<�?E$3$+<�?E$3$+<�?E$3$+<�?E$3$+<�?E$3$+<�?]$3$+<�?E$3$+<�?E$3$+<�?���Iŉ�?������?JB�d��?E$3$+<�?E$3$+<�?E$3$+<�?E$3$+<�?�W_ ���?E$3$+<�?E$3$+<�?E$3$+<�?E$3$+<�?E$3$+<�?E$3$+<�?E$3$+<�?6e�TP?�?�P�.<�?*��$+<�?E$3$+<�?E$3$+<�?�źl@<�?˃O$+<�?'3$+<�?e.+<�?�b%+<�?�1D$+<�?pt$+<�? 5$+<�?;3$+<�?0G3$+<�?��4$+<�?K3$+<�?        n�o�0�?A����?m�ٹ{��?A����?A����?A����? �����?A����?A����?e�ˠ��?A����?A����?E����?cɔ�q��?L��-��?��$hU�?A����?A����?A����?��>���?���%9��?���L�?A����?A����?b~�&�?	�3փI�?��J~���?A����?A����?A����?�����z�?��# 5�? ����?a�:L�H�?D����?A����?O����?A����?Z޻���?W3$a��?���W��?5�X���? p��M��?2�����?k%s���?������?�q���?��qo��?������?�MD���?L]���?������?Ɓ���?�����?������?b����?                r<z�T��?o%�˴?@�H�δ?���C�δ?���C�δ? 0�δ?Bu�nż?3h@l��?@[��x̴?���C�δ?���C�δ?�g�_�δ?pj���̴?5K�yδ?�����?���C�δ?Bu�nż?���C�δ?-.�C�δ?�E�/�?�5j���?w��3m�?��~Q��?���*��?���r�?�����&�?�B@	Ⱦ?|ʙ$�?c�J��?"1�*v��?�A�|p�?C��C�δ?����R	�?���C�δ?���C�δ?���C�δ?��n�ִ?SC%�s̴?%>_@��?��Ԩ]δ?6-�;�δ?�@δ?�ʮA�δ?h:�Zʹ?urLB�δ?�+fz�δ?��l��δ?F*3�δ?%�"C�δ?�L<@�δ?��wF�δ?�N�d�δ?�e:a�δ?(��F�δ?��_�δ?                        ��?J��?��D^ޛ�?w�ٛ�?w�ٛ�?��t�ٛ�?xU/�t�?��Č��?���혭?w�ٛ�?w�ٛ�?��{؛�?0�R���?K�Ս��?�.����?w�ٛ�?xU/�t�?w�ٛ�?Cj-�ٛ�?ÈM�s�?���!�l�?��C�?W�5G/��?`�OTՈ�?�=����?�C4�1Ҧ?du�����?�ղ�¬?<���?��Ar�?<q��M~�?�gu�ٛ�?�>����?�w�ٛ�?w�ٛ�? w�ٛ�?|�hR��?�4��昭?�o�C�!�?5O*�٤�?7&&�?�t��u��?N�p�ٛ�?٠��.��?�;��?���|��?:���@�?/����_�?�'�+4�?�ۚ��?
����5�?<FN�}խ?�g���ɭ?k��=�M�?-M�W�ĭ?                                j|ԑ��?@��4(�?@��4(�?�(�?��vf��?#�3���?bWf���?@��4(�?@��4(�?�
a8'�?$#�r�?@���?cˠ�SB�?@��4(�?��vf��?@��4(�?�\�4(�?����z�?�\Y��Ɵ?&4����?)�����?r�E�O�?��Hh�?x�uW�?���:Ӣ?�d��wn�?��Ϊ���?s���I{�?z's��?�\�4(�?E���?r��4(�?c��4(�?S��4(�?�����?�K���?|:����?�o2ށĦ?����?@F���?;Q�2(�?ŃȲ��?��p1�"�?1�!s��?��8���?��@�Ԧ?3��9�?ZI;�2��?��,yA�?��>���?�=�d>��?�qg��7�?[S�d��?                                        �j��?0���آ?����آ?�Ip�ʫ�?�;sF͢?�:�ע?0���آ?㎾[j��?wc��آ?軷��ע?f�j�آ?
z�
7�?0���آ?�Ip�ʫ�?0���آ?a1Y�0�?^/e�!�?ռ�� �?�ҏ���?	� 2���?���1��?§��9��?�Z;-��?�/(0m�?�t
�K�?8��JvɅ?�6��`�?7����֕?��آ?�WaQ�V�? ������?X�+��?m�DA��?$��p=Ң?�\��ע?Bx��և�??:ؓ��?��e�%��?���آ?h��|�?�G��ע?�e�L���?��B|��?E0��?���?��H�i�?~D����?l�Kx�?+ 3��?� [�aO�?�iA��?��c��ʠ?                                                [�E�!�?k]���?�2�L���?�"�-&ԟ?!B����?.��S!�?΀��$@>�*-���?k"��?`ùB��?M���՞?.��S!�?�2�L���?.��S!�?6b�=���?�#N٣Y�?�,�ԙ�?�t����?�g֫�?�5�
]�?�q<���?��D�Ţ�?�\R��?��~0���?A����p�?�!�����?���9|�?`�K�{�?����^��?�H�����?�й��͞?��?�Q�?n��ƍܟ?��:`��?S�JU�^�?���,��?Z��'��?��^yu�?�'��?+&g��?��A�O��?x U�b��?��\�PQ�?#�F{��? 
�-y�?���ҘW�?�8쒝?ޞ!�$��?Ȣ$LJ��?98���͜?��w�lm�?                                                        � p�W��?4Ә�⁖?�Fz�A��?9��c���? ND��;>�����;>�{0\��?5C�F,��?�)|{=��?n�����? ND��;>4Ә�⁖? ND��;>���[���?�K�Pؖ?�����?6� �dݓ?�v��ӄ�?'�C�M��?�t��S��?���?B��8ܔ?�R��ٚ??8����?�����e�?E�dB��?e�+��Y�?��	6���?��q��>�?<�2 q�?�v-��Y�?������?@�����?���X2�?��tX�?6�-R�?iplG���?e#랸��?���tvޛ?����0��?;��[�?�D#_�&�?�8�;���?�}�~��?�q)o��?��ZУ�?��A�]�?9y+�?�����?%��[��?                                                                6XȦ���?�#�c{p�?�[m󘒔?-^S��4>煆��4>���Z���?�������?�jz'���?h����?-^S��4>9�?���?-^S��4>��w�9|�? �%9��?���d�?X3����r?�q�R��?����E\�?�Z�B��?���&�3�?��]��?��,c�?"��g�?��AH~h�?�Ȇ��؇?f׿C-ˌ?]�r#ׁ?j�K�#��? ����?��C-ˌ?C�mV?��?<g�ƍ��?W6S<�?6�N/X�?#>�2u�?3�e:[��?��SA둔?�߸���?l�uz�?' �8�Z�?��ρ3�?=U�]H��?�-�k��?�#��,H�?e��#��?��&�!ʏ?�h��_ϑ?G��#G��? ���DV�?                                                                        9�e��?��.��?3�����6>�3���6>ϝh��?.Z����?]EJ��?Ɲ��̕?3�����6>d� �%3>3�����6>�Ωs�?ӄ!?�G����?��w�]�?�I>/re�?#u��V�?�}?���?�l�� �?+YWs�ג?�ArR��?Ǟ7yr�e�t�>WO�?Z)>+	#�?=��u̎�?������?��� �b�?0����m�?�q�u̎�?k�x�?���"��?���[-�?<��)L�?�@�k�?���Q��?��Urp��?�a�xӆ�?���N�q�?9��"O�?��{��#�?��~�J��?`Y�,֔?�s	�?���:_�?9�<ۜk�?���E��?�&��\�?eiX���?                                                                                �=`�]�?���
@�4>��@�4>#��$�b�?v�l/a�?�*U4�b�?ק�$?���
@�4>� �5f1>���
@�4>jd\��J�?�*�˯Ґ?�$�M[n�?�~�p�?^k�h�؁?X���4�?PX�m|�?;�L
�?]��0��??+l�MA�?�P�j4a���e(��?ѭ�8��?����w��?S"mD��?H��\�]�?�\rz�v�?eŅ�w��?1I�[�~�?f0*��`�?r��=�?�*�m�&�?�`���C�?���j�b�?Q�N�`�?-�z��[�?M�4��H�?�╞)�?�\h���?�����?�O��Ԓ?}����?=;Ϗa�?��s}�?p"�S:��?���Gg�?���K�)�?                                                                                        hq$P�"?�S9%�|=di�i=��>�HL���>��
���>˺�Y׳�>TxPP�?��|��w=TxPP�?R�`��>��E��>I���,�>��XjO�>ޖO}�/�>"_�g���>�r�>��C,��>R��Rph�>c�w�b�>g �JyQ�������A�>����>Cq�@6�>�Ou~��>��3�{M�>�.DS���>.m9d�S�>��,NO�>��Yߞ�>w�W�\*�>G\�P�>��nw�>o����>ݢ����>������>oF�4~�>�u#m�S�>�'�.��>�0ü�~�>eΗ@���>Լ�]8��>�a@[I��>��pݽV�>H"����>)4L`��>�^�4��>                                                                                                �N%P�"?��A.E��>B�S��>�^����>��U׳�>�aY�l={�R��w=�aY�l=M𣏕�>�D��>�]��,�>��XUjO�>)9�x�/�>,;�b���>,���r�>��U?,��>�hOph�>��,�b�>u�vQ���e=�A�>Ӵ���>�뤅�S�>B�!o~��>a4觟y�>�����=�>{0�06�>�L'NO�>��Fv��>9V�\*�>��PyP�>ՍYw�>Ҥ˰��>�)�F���>@�4l��>+�-~�>�Gf�S�>���^��>˯~�~�>��@q���>fsێ8��>��TI��>�����V�>�q���>ao�`��>�7.��>                                                                                                        �ӹ��>�?�Dpݑ�?���@5��?Ŵ�w�?f��5�">���<�/>f��5�">�E]���?��\i6��?�R���o�?�sr�8�?�]�B�?��?e��?�nچ���?�˞b[�?�e}�Ȍ?P���q�?���~Z_������E?��y)��?��� ��?�V�>�%�?	W���؉?�����Ґ?(�r��4�?�����?&A{<���?�s[!bC�?���K�\�?����v�?�ZQ�;C�?\$B�S̲?��g��?c�R˯{�?G��U3_�?ɚ�;�?��ؑ	Б?(����(�?ZsA�-��?���<�7�?嬎�%��?(<#� �?�}E�Đ?��a�⌐?                                                                                                                9�#c_%�?<�(���?X�ي�a�?\|���A!>!��v->\|���A!>3N�)�+�?"N%�r�?��Q�d�? �2e!�?�=����}?%�u\�?|aƁL�?<�%S"1�?����k�?����܌?��a,�\��7lƨ|?��NK���?�DOX�?����?\s'V��?Xa� �?��Շ?�2M��ԇ?�c�AB�?;z4UÐ?��p�ڐ?����?/��}�މ?��+f�?�����?2�����?Y��s�ܐ?妧];��?�]C6vY�?yf	��?񙄲aJ�? /b��?�8�\�U�?����2��?7���tȎ?U�.v�a�?                                                                                                                        ����?�3��8L�?'��U��>�h����*>'��U��>V,�PV�?������?$3rʽ�?�$1����?�|�Ĩ�{?��`W&��?X���c�?���^�?�G���m�?7^f���? �RT̛Z��k���z?�}x�?�w��r̅?�9{?^�$=�?(g��?K�ަ�	�?�����?��� ��?m����?ܸ�F��?����P �?m��ov��?�drJ历?�j���?9�5�8_�?t]���.�?eG�́�?A#K��;�?#���?}�����?b�l�g9�?s��b�Y�?�u�H�?sΔ`v�?���a�?                                                                                                                                ������?�{�:�>ٰ�̸(>�{�:�>�*�?�U�5�t�?�k尬H�?63�3��?�L�6�x?"։ԂX�?!|3�V��?`T3��?�*����?БX��?v����W�#�6�lb?��
Y�?��.��?�n�3��?C�rؕ��?�.6�5��?�z6"ҿ�?C��FJ��?��{����?D�ż�?C�)�x|�?�2e��?ގt� Ƈ?|TӚ�?KPf�#�?�n!��?���98�?�̞#��?1(�s�? �,�?ߞ2��?�(��0�?2�ah~҅?wn;�s�?�����?�ڣ��,�?                                                                                                                                        lw�ҏ ?/��E��c=C�Rjg?m�� %��>��H����>/����ž>gTcOE��>6���s�>a0���y�>�2'\"U�>8�AD��>O"�>�k��>a��������
'�z�>��Ϊ��>ZkN��>'d�uЫ>ݹ&�s
�>������>uͫ�T�>�H�S�>xc m(��>�������>��w�?�>��Z|�+�>��w�F�>�Ź� ��>�N����>wE�7D?�>L4�p�>��8����>c`3`g�>Q_�����>w�!����>��	ا�>��Z+�>1����7�>��0�S�>�U7����>                                                                                                                                                �3�!P�"?��/kW=�i�I���>���$��>;M��8z�>�r�ᩴ�5����x�>��>���>t#���Q�>^�o'�6�>g�+I�`�>\F�.��>r\����?���>������>����ߘ�>H?��P�>���о�>�ȗ�%��>��G��>X�i���>HZ$�G��>��э��>*a顓�>3R����>�i��;�>�e�Gx�>�i��Ғ�>1V����>N�D���>�K���>�\�=]�>z��.��>�;0�hQ�>}h����>�} \�>.q���>���(���>�G��h�>                                                                                                                                                        ~IkE?�<b�}��>C�f`=�>�Ű�µ>���>�}�b}�>�-��3!�>J7��>�F��p�>��u���>�M�=W��>�Ӊ�x⋾I����>����>I����>m��쪣>Y�П�=�>�d�V��>O�fW�>=�2HV�>Q���>��*����>��*����>�!	Zb�>z��$�m�>Q&��&��>���Ԑ�>���T.p�>:����V�>0�1:7�>-�5���>ъm;���>���Y�>����-��>�7̍}��>_�ë��>R�p�ӽ>z��U>p�>                                                                                                                                                                ���+��?m�+d��?�2{��?Yg��L'�?N�;ft�w?�:�e��?��{tM�?ar��i�?ΒV?�3�?W��k)�?��J( W� }�j��w?�4c.	�?4�i�?�wL(�Ip?��|�ۍ?"���E��?�{��Hc�?���?�ᝲQ��?-f���?W�4���?D���#�?�V�󴆋?��S}պ�?�	ѡ�P�?���:~:�?*�D��?"�i'܊?Q�=�?���8G�?��y�N�?��j^L]�?)JB"�?�lb5��?��^���?��O�a�?                                                                                                                                                                        y�m�?�8e���m��&8��x?ߕ��q?��E��?��H��+~?���<�|?u��B��?.{�k6�?�,�n6)Q�7����?B1�y�w?� �'7{?�ֻ��E�?ga�\P6{?Yt���?�^�)��z?�'��l|?���y�H|?\��W�?�ؼw��?�ʠ|�*�?)����p}?m"�W�{?�ʰ��ς?q��t�;�?�ႅ|�?=��W���?1��d��?��{�Ȃ?�����?C3l�ق?�����h?�5�����?��x�J[�?�KA��?                                                                                                                                                                                �$�!�?vC���u?o@.��Bp?�^��`}?����{?Mx[z?�n���|?z����q?�&#ZO�c�9���?y��C~u?�
��Dy?�O��/𕿮C��*�x?/Q=?#a��x?��5_k�y?���ޅ�y?6��g5?:�d���?/7d�k�?�@z'��z?/nC�]y?읠�.�?9Dy{�?,H�^�?:�3p;�?9�w�ρ?�;�7�(�?3����?:L�~�7�?1b�#Ѱ|?��fZ��?��+ީĀ?��fͱ��?                                                                                                                                                                                        ���I��?Za�Z����cs�Mx?��:���v?��c��u?�#8"��?V[Ԉ��y?�~��с��MT��!e?�-�C��q?*JM(�t?�0���c?�{g~�t?�ᦼ��y?�t�?Lt?m��t%zu?Y-
�hu?7���k�y?/��U��z? k�z~?Zm�q�*v?�I1Oh�t?/�;n|?��C�n�~?K��?e~?�"�}*~?�,��jx}?�|A�gc|?��wV�L{?�F'�||?���<ɺw?�ܲ2��z?��]ܽ{?'a0�%a{?                                                                                                                                                                                                � �r�?��f�t?G%�Cs?L*�kr?�P�]Ɂ�?�U/�g`�?"���ؚ?��;��a?��!�n?�b6٬q?=�3n2�`?�vlW+_q?0�:��u?rڐ�%q?�.\RDr?ޛ�(r?h�6���u??�k�v?��m2޿y?�!�;$�r?�)�ᳺq?֚�w�x?c0C�y?��{Ab�y?�o�	|y?��?�\�x?�AF�w?P��!w?Ǹ�\�x?w�i�s?����`v?�2BJ)^w?���ICw?                                                                                                                                                                                                        =����?�۫�i�?�t#���k�������s?���Q~#x?,��i��L�V	߆j?�>˴cD�?
����y?�����h?S�dUTy?Bc-W�?��(j� y?Y�K=tz?;���$_z?�T�㌸�? W�ޘ�?�_x�Ă?��7J?N{?q	6���y?�=�7��?2(T	�Ղ?� x~j��?���G^��?O�� �&�?��رn|�?��@^�Ѐ?�oN|���?1�R�=}?��ۘ�a�?��vL��?,soٝ݀?                                                                                                                                                                                                                4տ�ۊ�?겋��z�n�ؑq?X�!iu? 8�s|I�p��~�g?A�->㾏�����v?�G0ce?�C���wv?[�A�[<|?�QD�I-v?�*�vw?X
��,dw?���#ht?�N�v_}?V���Ȧ�?M���A8x?a����v?�	�v{?l��I���?a�Ϛ�?�ۥ�{�?��q��?/�l<�? ��p�}?j��NQ ?J�pf��y?�m��j}?[ПH�P~?��b�}?                                                                                                                                                                                                                        v{x~�j�?O&(s?�Aw?�q�F�K����ji?�uͤuĘ?�{s9��x?�Y/	�;g?� :�fx?��U
̪~?Ur�*x?���%|y?��i�gy?ԇY7�M?���@y?M�0���?aJ��*Nz?���\�x?��i�%C�?�9�"�?p:���?RMPݤ�? ��{K�?~�i��?y�j�Hv?�w �L܀?l{|�^#|?��2�o�?�a�Y�i�?�ެ�<�?                                                                                                                                                                                                                                O;�u�?#(�|����8A�ى�����]�`?�l=ǅ(d?w��ǥp?O��G(_?b�՝\p?mUx�$�t?ΛnЎ&p?P.+�,Ӂ?�:E�q?����S[r?l�1�|/u?P7��'Ax?P��j�q?n��	Բp?gH��0@u?{˧��Ox?^�N�x?�|���w?�~�h�cw?KD�v?i�8�RQu?$��$�u?:#�]�wp?��(ŗ�s?��j�.u?�d륣t?                                                                                                                                                                                                                                        �ѫ��?�L�j?��i�JN*�e?p����,j?2�� ޝu?�7on:d?�w/��>u?o���l�z?NQH��t?S���q�w?�����v?�i@9�w?w�sT�{?﻽�~?|�i76�v?�u�Ϯu?�&4�{?/�<ʹ�?���bb��? /��)?�01��t~?'��"K}?f?�w2|?���q�h}?�xG��dx?���D�{?ܚ���|?Pk�4gi|?                                                                                                                                                                                                                                                ��X�w�?-^P�5��>g���ˋ?�_�١?��+��>�X=:?�/���?�Wܸ��?C����JO?D^�ZX?���z�?�"�}?�� ��P?�¢F:?]�T,ܹ?CL�v�?�]ɱ�M?��P�8	#?F���?t��x�?�ٵ5%�?�bx�D?H��h�	?t��K��!�4���>ښ���\?w�8��� ?                                                                                                                                                                                                                                                        >�?��=�?�Cq֘\?K1�$��g?=27�5e��n��j�5g?d��\�+m?|��A�f?J��ۼg?ܷ��Q�g?�ֺ��
j?]�h�n?"�74q?��Gl2i?ȿk@G�g?�R$�%n?#ǌ$wBq?ZUxߨq?5Ӭ�q?��,�p?�wryo	p?�T΅�n?w�^��p?����j?�6�#�n?�^?8Yo?Z#����n?                                                                                                                                                                                                                                                                V�vC0�?����Z�i?�+vq��_?+�.��Di?��z�o?����h?F��GG�i?]]��Oj?h�Ŀ���?1:��Z�t?3���\�r?��B�<k?�V�o��i?e�����R?�hs*�r?�o*��r?T�2�L-r?�C��q?�ղ�"	q?u��s&o?2-�;gq?�?]s(m?K$q�Sp?��D�p?\;^�p?                                                                                                                                                                                                                                                                        �b�(�?���h?P+~F�r?��2)�Jw? O�jr?���>�vs?ȍ+�$�s?�h�Q/s?ڠ�	�x? `���6|?��B�VVt?��L=Gs?�'�o�x?.�I�9N|?L�&'�|?�V��{?�1��L{?�cTjaNz?�Ù�-Sy?�Hvcz??��{�v?O��{�x?T��^��y?n$`��]y?                                                                                                                                                                                                                                                                                V9,���?Z2�`�l?�?=V,r?F3M%�l?�߁@Վm?�@
/��v?���="m?D�<r��r?����Nlu?#5��@r?ۭƟ�m?��J�?�r?�9���}u?��|Ru?�h:�3u?⾸Fa�t?XɦtY�s?�K�:s?�]��	t?���l�p?������r?3Q#�ڄs?� ��Bs?                                                                                                                                                                                                                                                                                        ������?eZ)iY��?�����p?=<�lsr?����q?�ƅ}P/r?/��*Jw?.��q�z?SW%g�r?���q?�l��w?Qv��z?�l75�z?����vz?�M�4S�y?�4��Y�x?�O)>x?�:!��y?�x����t?(�`�\w?�u?�]x?�~�rx?                                                                                                                                                                                                                                                                                                �B��P��?=�:��l?M�T�p?ѮC��Vo?@գ)�p?uJ�<�[u?�|���x?��f�.�p?���z��n?���[�u?S��:Țx?��H��hx?$��#�Dx?�XԻغw?� ����v?ߢ��v?������v?�M^|u%s?����lu?�ۄ�~Xv?�T��v?                                                                                                                                                                                                                                                                                                        ��H/��?hc���q?O�F�f�p?�~��Eq?'
	av?7:��fy?msk�9Dr?OF����?H��~llv?ߗi�{y?,J�)LHy?X��7�"y?3�7�x?��5P�w? ����v?̆��w?2���s?��)̄0v?p����$w?�w�v��v?                                                                                                                                                                                                                                                                                                                \3�\ �?�W ���q?���Fnq?��7�Rv?	��:��y?��� ݡr?�(�r�p?y��v?5e6E��y?��*�P�y?�	���]y?o�&�x?,ڧ���w?���]y�v?ߺ�W�w?0==���s?̕!Zv?uV��_Tw?�YQ��w?                                                                                                                                                                                                                                                                                                                        �
e�U�?���&q?�\�Q��u?p��9y?Gޘ��%�?�:T�	�q?�6{�{Dv?����}Ny?�"�Py?�C�29�x?��,hx?�n����w?��a�Y�v?g��6�w?��
��s?��}�9	v?hb\��v?zu��v?                                                                                                                                                                                                                                                                                                                                K��p��?�!f:"Ԭ?m	��{?V���n?�^��n?�7ey?ݽ���w?�󈹣�w?p��yw?qe��,�v?�:O�Tv?2��Xu?�cpq:v?Q�$��r?�����t?�i�_o�u?	�;��cu?                                                                                                                                                                                                                                                                                                                                        ,��V�B�?H�N��?[gq�o?�h��Y�n?X`��uSi?��� x?$n����w?K9 ژw?��
�v?i�}�*v?b��f6�t?	�I�dv?�M��"�r?�s2��t?��!y6�u?�R_�u?                                                                                                                                                                                                                                                                                                                                                Z��j���?���Ο�q?4o�٤q?��zEz?�x<��w{?D'B�dB{?�^�h{?��C�jz?��5��~y?����x?���ُ�y?ƿ!�:au?�x����w?n���x?����x?                                                                                                                                                                                                                                                                                                                                                        䟛��B�?NX��"�?�&)m��r?!\ʾ�pu?}G�e�Du?zҺ��&u?�5��ԯt?b���}�s?�W���0s?�Cc���s?�J�YB�p?��E�"�r??��ys?����6s?                                                                                                                                                                                                                                                                                                                                                                	��b���?�W%
l�o?�U'-��q?�rz�S�q?����E�q?-��a�?q?w$mǞp?�%#v p?]d�Ȫp?���?J�k?ƫ^J"o?^~��<p?��$�p?                                                                                                                                                                                                                                                                                                                                                                        6�X�bM�?�@���Q{?��JNK{?�t�gC�z?�}���Yz?�;zOdy?���	ox?�B�<�wy?{�J��Bu?�+�9��w?oM^���x?�~3[�{x?                                                                                                                                                                                                                                                                                                                                                                                h��7���?"ʨ0>�?1L����?�QlY/�?���Ӻd�?s���z��?�ktPhƶ?��z*_�?}=PO��?�Ik5���?˗J�?                                                                                                                                                                                                                                                                                                                                                                                        ޓ�����?��c�k��a]�j�͚������d?�դ���1?�"��릞?x�!��?���w�?�^#�]��?4|,lQx�?                                                                                                                                                                                                                                                                                                                                                                                                y�)DUC�?D�n�?����f?J��?$�?���zሿ�G�BS�l���{�P`��3_z73��������                                                                                                                                                                                                                                                                                                                                                                                                        ����?�����?�c��?[0l�Q�?\�N��t�?�p}��[�?�F�a��?�M�Y8�?                                                                                                                                                                                                                                                                                                                                                                                                                N�>|t�?$_�i���?ǒ
�͹?Ⱦd�5�?b�Tb债?�d�w":�?nc���϶?                                                                                                                                                                                                                                                                                                                                                                                                                        ���oI�?𹑛`��� �7V%��Wـ��ݰ��5����a�`���                                                                                                                                                                                                                                                                                                                                                                                                                                ���A,��?a�����?ZL���>�?k��,�ת?%�C���?                                                                                                                                                                                                                                                                                                                                                                                                                                        �c�ի�?���Ԣ?�����?b{(��?                                                                                                                                                                                                                                                                                                                                                                                                                                                e��F�Ǚ?4�PB�j�E0�=��?                                                                                                                                                                                                                                                                                                                                                                                                                                                        lr=�v?���7Mh�                                                                                                                                                                                                                                                                                                                                                                                                                                                                S�k~�t?�t�b�&�      �_woodbury_vector�h!h$K ��h&��R�(KK9K��h��B�  K��W���t��� �H;�_u��XM��F�@���� @���Ǝ| �p�M�Ϫ忝�l�s@�,�0���u4�: ϓŗ@x{��Ҫ���z�| ����|�-���j�d�
�M�nV���@O ���@�r�0Ъ�nF��0��\[�Ъ�6�%�@�\�rk�@K�Ȭ��@㒍�s�꿁u��8K"��ܑ��� ����@|��?Y*9 �@'+�y� @7�'��
@g�l�v#�?�&5�e�n���wA@���l��l�?���@�7 gz��*K|��@.�~��4@z~]��?6��-��K'2��v�bw�y��
@6�w��i�����1Q�ڿa�ry��@G�O�X\2��"�v�;@�$��@���5��!�^���Po���a�:
�������a@]����C%@o�e.�\@�ć_#Z��~] f��t�b�_woodbury_inv�N�_mean�N�_covariance�N�_prior_mean�K �
_precision�Nubh��h��h]h[jF  jD  �_log_marginal_likelihood�j~  h�Cf
����O@���R��	grad_dict�}�(�dL_dK�h!h$K ��h&��R�(KK9K9��h��B�e  j�t���~��3@K����J'@�X�ﷴ(�4���&�3�dW�x@ܗA�Ǥ�?3U���JW:��@���Bͥ&@������q;�ˤ�?ō7,�x@���8@�{Y�@�K�{*D�?%g!��i)��rǙȤ�?�EeS�@�pȤ�?��Z�ߛ����v(�*}�6�9 ���q�? @
�5��r5@(��w	@��x�֯���S��@��7o"0�j,��{3�'.'�"��Z�F�3��V!e�� @�rGg���Wӽ8n@�E"i��&@��u��?�_�p��kT"'��LY�C�~8>�(@s|�P!@�����m�:��@�+�)��?�		�f/�k�e>M�E@�u*&�O�@�_#O'��N�5@�{k\[�"@��	�)@�Ө��u���^9�e��Aq�p�U<D�,�n@S����y@��~��3@+*��@p�9Q �4@���Xt�5�0EG��A���	�a!@^�R�{s@�k����'�=[w�,@�<����3@�(2�'��E{�~s@\]��b!@$��5�@�g�Ħ+@���1X@�sy}P8���|s@u�Yh�,@�yN|s@�:��z�$���b��K5�VK�"�#�}�h�q�@�T*C@}vU��m@�|⏦�4��98w�� ��wb/��<��-���lA��Uքe�+�^���"@(2�p��@�����H&�`��7�=3@���:xF4@�QO�ʾ@\k�%�Р�/�5���X���9�Ev�}$@Ś���-@z-�qG,�M����/ @	��?-܎���;��h��'"S@Z��[R3\�c r]�4���1��B@J�t9,1@��`/�*@�i͵�����F�?d�}��p`��>{@J�����@K����J'@p�9Q �4@&h:�u�7����B��)��ړ�	�4�1Gj��@����^J�?,I�HQ��V�D�&��v_�ë�%@�������ZvbJ�?W<�m��@,�Kӱ�@�'�� @��1׹ @���]�*�<�^J�?��g#���$�_J�?4^Ni���@xX�E)�]��b� ��i��� $@+OUkX6@y�wd���?"��<��'�Wz���jl���)�R]��`�4�X�@��8@>��P'��	K�*"8@G
t���Q\CH�@����U(@�#K"`�?��*�(��ɒ�R�(��[-���ɗUz�@��㫧�!@m���AU ����@V� ��?T�T�\0�������F@L��H�P�K���P(��Y(6@IdH��w$@-Z�V�� @�ʄR�v�s���=:�*m�lw�q��S�p@���@={@�X�ﷴ(����Xt�5����B��)��6%�}��?��7|!�6@������ٝ���ԙ+�@~��]�E�LH�į(��s���@�a�������.��1�)�{c�� ������=���mN�8-@��������6��@�E�h�h����s"�&�@�CsJ�+@$���"@E:�x ��Ik��7� gE݈��iiذs*@��PQ��?tl�E�Z2@̡O�*6@�y6۰h!@�GW��@F���a���\���@��A�W� �ë*�4)��&�����,U�}@��E�+@��>Gy�?�0�����I�=�"��Nda"@�>c������\�[�S�P�D�1@]~��^H�cБ�>�Q@&F��T*@�|���*5�q�s-X1�(���Q��T���w@�����7@v'�4t@݋3'��p����b~�4���&�3�0EG��A��ړ�	�4���7|!�6@7��r}3@��~��$!�y�Y�o��s f�l(@�f�x3���d!4���ʒl'@��Io��ba��$!���I���?�{ v�+�T�Z<��8 k[7@�h�Bo�Yִ{3�=�1o�o�X��E%@�U)f\6@� ���.@zDi>����G��[C���w�<c���l�l5@��3��@;2f畮=@����A@�BYO�7,@OT�o`@Vg������d�&@���\R�E�2��j4��p��������UT&@���Ն�5@��D�Xj�?*_+�x$�����-�?~�U-@]�}L' �^Ds����y��<@'j�(tT�����w�\@$�`,p:@
sۘ�K�]�"8?@���j�1�����"ۇ@3x��R�[@����}@T��l���)���dW�x@��	�a!@1Gj��@�������~��$!�kZ�
��w�z֗�}�?�P�����l���?00�/@�5ݏ8���Ys�?J�X��wA9���,�? =��Zk@`$$%�c�?'p��C����3iVs�?��>7���?ef�FVs�?�Č'��g��wX��K���4���%�>�o�?���>I�"@Gï�¨�?��q����^8Aؿp�P�[rI��� �)˛t[��V)�
��´�e��?q��\g�=g��?	ؼm�@F�	j��?���J���Z:��#`�,&��%ſ��\�@��0\�@�e����
��A!@�� ���?$'>C������2@v��ɲ;�qp۩	��(=�"@�j�_@�@ЍJE\/@�sq�Fnb�F�w
7&���Ry+]��~h�Z@_C�4�f@ܗA�Ǥ�?^�R�{s@����^J�?�ٝ���y�Y�o�z֗�}�?y������ �ޚi�D�qO+�?2�}7���?��jM�Kj��gA��A�-n�?_�S���??B�)���?���W�?�n�p������gA��&+�?c" ��gA��wU�_鿹�ކID��<~���Mm��}�?_��+�@��Q���?�P�{T����K�!����G�^�BP���.��m�rC��l�ٿ��ԎJ�?�őb�?
��aT�?���RZ@��<�����Q�DJ�����?���.%��Ѧ�;�����?��r�G��?��T�j�pe�w�?8!"]�?�2�u�������@,9�i+"�롾�D����N��P@B�����?NΨ����?���L�2H�&����N�����C�D���O�A@�,�	X�M@3U����k����'�,I�HQ��ԙ+�@�s f�l(@�P����� �ޚi쿠 �;���ˉ������X����Qv��@>�_\�i�������^p�G�. �ج�ك������v��S@~b @�Y��i쿮������ӫH��i쿳�S
�7@,	�*B6@?�C���@���IM���h��)��Tw���r��C��@d���7�?�7���#@�JU�(@C�ax�@$B���7@��@pΗ��b��!@�)���ￔ_c���,�݁)4��t��B@ /r���@ji./{�?����;�	��]q���3�Z2�U@�<y���&��eֿ-��*օ#@vNm[�9����5C@�ђ���@g��;(I)��#yh����G�]�e�z�_i@>4f�-@p���}�d@x��S�b��.���o�JW:��@=[w�,@V�D�&��~��]�E��f�x3��l���?D�qO+�?ˉ�����E��w�]Q֩�@�|�Z%�D�+�?И7m���?_�����?1�ԏ�@�ǋ�39�?d�s�g �Tu+�?_K2���wA�6
�+�?r!	)������l�I��0$%��?�?���#�@�����(�?����*��G#�HMҿ_ď={��H7\-�� �L���"@�V3�%�&	�����?�'�0"�M����?.�eQ��@��@��?�̊�z� ��*_�����<p�O��w� �@�fQ�m�@���%�����c*�?�}&R��?���0��vCN$/@�
�8u�6���C�b�1e��y@i�\O}@n>��@qYS��Y^��B��H"�x�(�W�3�!b9V@\��٢b@���Bͥ&@�<����3@v_�ë�%@LH�į(���d!4�00�/@2�}7���?��X���]Q֩�@H��V����@^4����:���?���/@��2nr@��K��q @^9@Q @�.~�V�)��D����?%��N�@U�T����?�
����&�U�el(�//�SbU �jOh���@+7���%6@�h�z��?���'��@?!�j�����0���b�o�3�shu�3�0�}�(���7���@�������*.��@pYv���'@{O���s�?��R��,80�3��^�E�A�ۿ�q�̒\@�H��_!@�bW�s���|��@����d��?D����/�� AvQ�E@[P[�:'P�b�0l)}'�4��ϐ5@�ˤ�i#@�X6@ @r�c�|u�2ݤ;�9��/�8�q�*�G YCo@����gz@�������(2�'�������s���@��ʒl'@�5ݏ8���jM��Qv��@�|�Z%�@^4���P:nV- �?i�lnM����9�o� ���U��`����;o��k濧��T�@�E��jM뿏��\%��jM�tũ�A@��nj @��3���@�M���Q�� oΦ��(��aF�7-���IǙ�@��Q�gS�?��U:�2#@��]�A/'@oU�ۭ�@`I{�� @���ֹ����ѣl@
q�e`�x�"Y���|�.�g���ɧ@�����u@*�ȫI��?E6�������)�.]�o�+)]�@�p��P�����տ�4h��"@�s����8�����>zB@��t�@��ͬwQ(�SY�4^�xjo�2�)G�gh@�7g�+@��u���c@�bIl�a�fS�ņLn�q;�ˤ�?�E{�~s@��ZvbJ�?�a����Io���Ys�?Kj��gA>�_\�i�D�+�?�:���??i�lnM뿏O" ����!���x�?j��f��?t(�ʟ��?�Z�-�W�?������g����gAg���+�?��'��gA��o=�_鿱rn�MD��[�1���cs��}�?��|�"�@ZD[���?x�nkX���*=(���<c�^����.�G{F��3�s�ٿ.~nϑJ�?(T�{ob�?0�<�T�?���pTZ@�uv����gGcN��\�?���'���Ѧ�.��1��?F[4�J��?ŅQ_
j񿋉%�
w�?P��_�?F���w��`�r��@R�7ll+"��w��A����h;�P@�f)E>��?�=�B���?��'��2H��؊�N�����C�1�@7M�A@����\�M@ō7,�x@\]��b!@W<�m��@������ba��$!�J�X��wA��A�-n�?������И7m���?���/@���9��!���x�?mW�
��w�2K�-�?�,��[k@��$�c�?ט\�D��#c�?�x�?ևP7���?AMl�x�?_�����aY���"��5��'���o�?��	J�"@J�u_è�?�?q�������Aؿ?�w�Q�`���� �}�v0[��И�
��\�\f��?A�Gh��&���?:��m�@���ă�?��������$`����%ſ"d0K�@(�d]�@ې{���
�nV�!@�����?Urn��!�u~��2@Fs�ʲ;�g1��	��k��"@,9��M�@|h�X[/@� �Fnb�~�$�7&����Rz+]���T�e�Z@�'^?5�f@���8@$��5�@,�Kӱ�@.��1���I���9���,�?_�S���?^p�G�. �_�����?��2nr@o� ���j��f��?2K�-�?(�@�X(�L���(@D����r�?vpT�2��625q��?�uJ� ��?�V��?*U�B����z^73��:U���HxE��?�~�&�@�`����?r����C��M�-ƿ�Cr}��/�nMd�)�P�,kNLQ���W�!�?�)-�Bx��w���?�r�h�@��_;\�?�#+�D!��r�+�j��)��*eտ�ZF��l@"�УXt@M2���1���(��@�68q�Y@����r��d��zc�-@��:���5��anl�����P�X@d@�٭	@�����@��(=D ]�����!��P��V�Nf��(U@Ψ�g��a@�{Y�@�g�Ħ+@�'�� @)�{c�� �?�{ v�+� =��Zk@?B�)���?ج�ك�1�ԏ�@��K��q @U��`���t(�ʟ��?�,��[k@L���(@�*ċ�1�N�����?�����!��4Q����?f�U��@�;t���?���\N��ţ�4�9S1����*�B�?���& �.@�,h���?3�����G�	o����V��&�S��=YY+���q�(��� �pG�O�-�?N0#b��K4��G�?z�J��� @��".���?s�Y= j��8&'�g ���yب@EOg��5@����j@�:8rEx����.w@��&iE�?���_O�%���w�O�>@��S�fF���ev ���CV�-@��H���@^�ܔ%@m(?�m���u�2��JaD�g�$3+�e@�"�vLr@�K�{*D�?���1X@��1׹ @�����=��T�Z<�`$$%�c�?���W�?�����v翪ǋ�39�?^9@Q @�;o��k��Z�-�W�?��$�c�?D����r�?N�����?�2z��'��\6�(4�����!�W�?̶��59�?&���W�?�n:.���	Bh��9����
;���mq����?�JN3h@�혅��?w�dۍB���j+Hڂ�?"[����h�u�����7�'��g�,��п�,Φ�Z�?�"�8&-�Œ���?�"�i��?�&qr���?�� ��翏��j���k};?r�e7�@�q�@c�����������?{'�l�D�?� �6��xYĴM@� H>�#���ڸ����l$�+�
@]QGX��?�Eq��}�?R�P�jLJ��čoA�)iW�p�C�?{�(pC@��s���O@%g!��i)��sy}P8����]�*��mN�8-@�8 k[7@'p��C���n�p����S@~b @d�s�g ��.~�V�)����T�@������ט\�D��vpT�2�������!��\6�(4��0W���@��H����Zi�i �������bp!*�@4D��Y,@��FG:$@�F�� �	��E�8��P��(���;��U�n+@�A����?�#��3@����7@a2�ES"@}�4�@,5�/�~�&E�Ɵ@�S�,�?����^@*��K 	����|]��2@J�,@J�h�Qx�?�Fy=�*����]Q#���c�#@�Ȱ/�8��������-���2@>qUI�y�ǸD�R@I�ҟ,@:e�8�/ۀ��&���4n� ���:��x@�l��<�<@�SF�s@�����q��z��`~��rǙȤ�?��|s@<�^J�?���������h�Bo���3iVs�?���gA�Y��i�Tu+�?�D����?�E��jM�g����gA#c�?�x�?625q��?�4Q����?���!�W�?��H����38 �����LK+�?�mS��gA�<��_鿈��QJD���@y����\c��}�?t����@�����?���:U����5#��MT��^��N�.���t*C��ffu��ٿ����J�?��j}b�?����T�?<6z�RZ@0��Ǭ���C��J���)A����js��Ѧ�оF!��?6��=H��?�|� j��)w�?~��Z�?�g�hu���x�@z�f�j+"�ٜ;�F��ah4�P@.pWR��?)�k����?�v��2H���N��b��C��}�R�A@[?��[�M@�EeS�@u�Yh�,@��g#��6��@�E�Yִ{3���>7���?��&+�?�������_K2���wA%��N�@���\%�g���+�?ևP7���?�uJ� ��?f�U��@̶��59�?�Zi�i ���LK+�?���E��w�Y�D�+�?~�g�)����G��.�k}K������?�?`��?��@�iT��(�?ȹɬ*��KMҿ����?{�h!@0���Xg��"@�z��%�@�^ĵ�?���1"���[���?�1Z���@�Q�"�?܊�|� �ɍ�������R�O��wk:��@�@�Fp�@��ov���Θ@*�?6
lU��?���g�0�0��n'/@ R�v�6�^Tc�b�eo3�y@��_}@�ߣ�@�P!?�Y^��R�H"��j���W�k1g8V@�:��עb@�pȤ�?�yN|s@�$�_J�?h�h����=�1o�ef�FVs�?c" ��gAӫH��i쿫6
�+�?U�T����?�jM뿹�'��gAAMl�x�?�V��?�;t���?&���W�?������mS��gAY�D�+�?%<�����$@��_鿿.�JD���1�x��OAkJ�}�?��ɱ�@��g���?��U������"������^��@H��.��CR�C��L�ٿ'M���J�?�љ#~b�?c�a-T�?d���RZ@xf�Q������J�꿋������C��Ѧ��Q���?4�H��?����j�
�w�?��Z�?nހKu��ͷ>Q�@P�brj+"��ks�F���L��P@|]�-��?�����?0FO�2H�[|��N���åC�S�4�R�A@՛;�[�M@��Z�ߛ��:��z�$�4^Ni��s"�&�@o�X��E%@�Č'����wU�_鿳�S
�7@r!	)���
����tũ�A@��o=�_�_���*U�B������\N��n:.��俔bp!*�@�<��_�~�g�)��$@��_��rh�!��)M:N@Bf��4@�(7���X�(i�^&��>DW��Y�2>@m���?�"r��a!@|�*z��$@JQ_�DB@ �ҙ��?��3FS���'CB@�O}2�{����f��{F�{��? # �@�����@���H}�?h�lJ��@��N���p/�6�@�^� � �Xq��_�?��� @`T�2V�6�����!�@@D{S4c�@���P�	&����[���y���D�������f@D�x�)N)@�����a@=���( `�ad��rk����v(���b��K5��@xX�E)��CsJ�+@�U)f\6@g��wX����ކID��,	�*B6@����&�U�el(���nj @�rn�MD����aY���z^73��ţ�4�	Bh��9��4D��Y,@���QJD����G���.�JD���)M:N@PK�5�e�?&��z�f!@r�ʀS ���җ̤7���S��� ���)@Do�(���?��T2@�DJ�\�5@%z ;,!@.�vWV/@d��t��K��V@ T������l�i��(��n�����2�@�ٱ`4�*@'���qb�?������	�"�~~\�z�!@L�`�?��4@�<��\�SD#�1@��R�8�G���g2ÐQ@r���؀*@.���B7��L:�ʒ%��5� �J(�iEw@��d�.;@�!��еr@�>���p�9�C��|�*}�6�9 �VK�"�#�]��b� �$���"@� ���.@K���4��<~��?�C���@l�I��//�SbU ���3���@[�1���"��5���:U��9S1���
;��𿱭FG:$@�@y���.�k}K���1�x��Bf��4@&��z�f!@:/Wg�,��0���%�f�
�/���=�z�z/��!@6�a���?�Z�i�(@��I}��-@��jw7@�����
@����l���s��@͈"Ã��	4O�� ��;����꿩�އ=�@�)ʶ%"@�8����?��NB���#�)��=�0��@�9���	�7D�O)῀���'@L�uA�@����K�G@`�C��+"@��G1�t/��g@tp�Ν�3i2����_�o@��[@?=2@�7��qi@�Kվ�f��+�OQ�s���q�? @}�h�q�@�i��� $@E:�x �zDi>���%�>�o�?�Mm��}�?���IM��0$%��?�?jOh���@�M���Q��cs��}�?'���o�?�HxE��?���*�B�?mq����?�F�� ��\c��}�?����?�?OAkJ�}�?�(7���r�ʀS �,��0�����ʎG�,���8@|j���?�Ϳ:�������2Ò���l?8(�����X�y�l�����0���ؿ8�и{��?.\ �]�+���R�?��"^@���L��?'YT|����#��� � #X��?UǪ���?� ���?�|
餛�
�c&6��?m7/�?����E����f��@7�1�E&�.�V����Z����@�ڡ��'�?n.^2�?�gTny�M�����~T�A(\Y�G�r�3�tE@�7��"R@
�5��r5@�T*C@+OUkX6@�Ik��7���G��[C����>I�"@_��+�@�h��)����#�@+7���%6@ oΦ��(���|�"�@��	J�"@�~�&�@���& �.@�JN3h@	��E�8�t����@`��?��@��ɱ�@X�(i�^&���җ̤7�%�f�
�/���8@	����j3@�B��@����Yy6�;F�dּ���zm�8��`J"w>�����������(���O��@9�(j>L(����C�u@P�w{�O6@����IJ@���Z�'������?7�BM��h���̴��&@�~l*NF0@�(q���.�S`2p�!@3sI���?�C]�>�� C.�T@T�I��^�N�Ik
�6�V�IK1�D@�\a�3@+Tӵ�-@G��G���)�f�H����,g���W\�}@vd�)�N�@(��w	@}vU��m@y�wd���? gE݈����w�<c�Gï�¨�?��Q���?�Tw��������(�?�h�z��?�aF�7-�ZD[���?J�u_è�?�`����?�,h���?�혅��?�P��(��������?�iT��(�?��g���?�>DW����S�����=�z�|j���?�B��@孇�q *���x��>���V���������sGm<��Aɞ�H�nͿ�:��9@��h��	�(a��?ů39Վ�?�������?OIɒP��#��#I��X���g��?}�]¶��?0���?�
}����nt�B��?��eb5�?Ģ�T��?W��@��졕` ��|������uL�|@M
�	��?8�A8B�?3�-F�^��sH��e��r�@�ٿ��[�?@�1�
��J@��x�֯��|⏦�4�"��<��'�iiذs*@��l�l5@��q����P�{T���r��C��@����*����'���IǙ�@x�nkX����?q���r����C�3�����w�dۍB��;��U�n+@���:U���ȹɬ*���U���Y�2>@ ���)@z/��!@�Ϳ:��������Yy6���x�俰 5�翧²O��?� %4�91@,X7�$�4@f�+�=S @ U��W@�r�g��"bY
-@���Q��?e-OA�'�:��3��\�q�a@��]H�[)@�?j,��?&:fn��^�E\-!�O�d��3!@̅�t���2�8�U�h��0@;X�w�F���|}�P@b�l�YW)@\��o�6�:Q��$��h��[���#v@@�_e�9@�Y�<�q@Іխk!p���\�`{���S��@�98w�� �Wz�����PQ��?��3��@�^8Aؿ�K�!��d���7�?�G#�HMҿ�@?!���Q�gS�?*=(������Aؿ�M�-ƿG�	o�Ῥj+Hڂ�?�A����?�5#���KMҿ���"��m���?Do�(���?6�a���?���2Ò�;F�dּ�>���V�쿧²O��?�v���)��,�u��?��#�zn@$�99O��?a�WP�?��"$Z �?[ ��ğ�?�����?�CB<�$�o��
�?�m�?|�����?"]M����?=��p%^�is����(��@��?������ѿA��}��?l��ݸ�?���K)T�zx��@H�KEv�?l�0y}.�ZU������`�٢ܿ�oP!B@�Sd���@�k���>@m��^�:���z�F���7o"0��wb/��<�jl���)�tl�E�Z2@;2f畮=@p�P���G�^��7���#@_ď={�j�����0���U:�2#@�<c�^�?�w�Q��Cr}����V��&�"[�����#��3@MT��^�����?{�����^��"r��a!@��T2@�Z�i�(@��l?8(���zm�8��������� %4�91@�,�u��?���-�!@{�i|[;;@/��F�@	]�+@�9�\�ߝ��`�"@�Xh�3?�<�.���0��XŶ|��m�@"@Kފ2@��K^`�?�'X�~� �h�ҨpI(������'@�Y��v�`���j��a%�k]7@z���O�{ᮓqW@wUZL�1@J�M���>�$�tW�.�[U�,�%�n�x,��~@zЧ�A@��2?Z�x@�q�rv���I��/��j,��{3��-���lA�R]��`�4�̡O�*6@����A@[rI��� �BP���.��JU�(@�H7\-����b�o�3���]�A/'@���.�`���� �/�nMd�S��=YY+�h�u��������7@�N�.�h!@0���@H��.�|�*z��$@�DJ�\�5@��I}��-@����X��`J"w>�sGm<�,X7�$�4@��#�zn@{�i|[;;@a�O�4@�"���#@�l�ʥ@
^`v������R��&@�+&�]a�p�-4����%�g�)���
&@�:�_5@y1�o���?��%6>$�!f���S-����F��,@�:�������K�����ec7<@�54�0S�g�$�T\@����A5@9� ��B��s�RBq1��t/�J*��dGܝÂ@u_���E@0�kN�+~@����"S{�$ok�:3��'.'�"��Uքe�+�X�@��8@�y6۰h!@�BYO�7,@)˛t[��m�rC��C�ax�@ �L���"@shu�3�oU�ۭ�@G{F��}�v0[�)�P���q�(��7�'��a2�ES"@��t*C���Xg��"@�CR�C��JQ_�DB@%z ;,!@��jw7@y�l����������Aɞ�f�+�=S @$�99O��?/��F�@�"���#@t�s�+�H���%�g�@�n̍������(|�@�R�Ed����4sz�0 �?/�=���-@!�8_!!@�nnY��?�h�1h�v(\���ד�}j@���
�VpX�4�F�X�Z8&@C�l y>�7��
2vF@ugKW� @?��ɲ-��SZ�=�6��!Gw�O�c�m@,J�ЊL1@�ޒ�|�g@�nD�A�e���~
C`r��Z�F�3�^���"@>��P'���GW��@OT�o`@�V)�
���l�ٿ$B���7@�V3�%�0�}�(��`I{�� @3�s�ٿ�И�
��,kNLQ��� �g�,��п}�4�@ffu��ٿ�z��%�L�ٿ �ҙ��?.�vWV/@�����
@��0���ؿ����(�H�nͿ U��W@a�WP�?	]�+@�l�ʥ@��%�g�@�h�(�3���
D!��4^��k��?nH�$;L��/��*��M�6�G�ȿ�)���?�R��~@nL~YX��?�A/+Ri���i�1��	��@�%�9���ⳇ��>g��@v�G|�t(�u�ؽ52@�J�,o�@۫f������oh	�0|Zw����O����W@�"/��@=ހ|ЬS@z���Q����L�]��V!e�� @(2�p��@	K�*"8@F���a�Vg��´�e��?��ԎJ�?��@pΗ��&	�����?�7���@���ֹ��.~nϑJ�?\�\f��?��W�!�?pG�O�-�?�,Φ�Z�?,5�/�~�����J�?�@�^ĵ�?'M���J�?��3FS��d��t�����l��8�и{��?��O��@�:��9@�r�g����"$Z �?�9�\�
^`v����n̍������
D!��5l+wld.��(Q����N6����?:��k�@Ŀ����?��fׯ���h;��:���>�t픿JDjԬ�@�E7�?������������?B��v�]�?�,�?���0K�`H�#@cU?l-���ЁyP�n���CN@�3V�g @�O�5~�?f��]S�^�w�r��=N���� L@2k.F�W@�rGg��������H&�G
t����\���@����d�&@q��\g��őb�?b��!@�'�0"���������ѣl@(T�{ob�?A�Gh��)-�Bx��N0#b��"�8&-�&E�Ɵ@��j}b�?���1"��љ#~b�?��'CB@�K��V@�s��@.\ �]�9�(j>L(���h��"bY
-@[ ��ğ�?ߝ��`�"@���R��&@��(|�@4^��k��?�(Q����"{�#�|'�D�:￐ǚZN��~c�SR�t{B�\@5E�;�@�7�MT��?�b�� ����ɱA�<���@����l�>F��KJؿ�Q��P"@2�2~8��m�r$B@� }�@sT�g�'���rQ����Xι��th�g@�p���+@'i�jc@�N^w|a���F��m�Wӽ8n@`��7�=3@�Q\CH�@��A�W� ����\R�=g��?
��aT�?�)����M����?�*.��@
q�e`�0�<�T�?�&���?w���?�K4��G�?Œ���?�S�,�?����T�?��[���?c�a-T�?�O}2�{� T������͈"Ã�+���R�?���C�u@	�(a��?���Q�������?�Xh�3?��+&��R�Ed���nH�$;L��N6����?|'�D�:�����.4�z�h���@���RH��?8e9���3��!l ���ٗ_ �?�j�bm�?�i�0�?�7�CGD��?��p�?�9X;�?H�� N��ŔgQ @E�kg�'�x�fO�H���m
H@.������?�W-����?�לM��O��H0�WO�XP��VH�5��.�G@&E�?S@�E"i��&@���:xF4@����U(@ë*�4)�E�2��j4�	ؼm�@���RZ@�_c���.�eQ��@pYv���'@x�"Y�����pTZ@:��m�@�r�h�@z�J��� @�"�i��?����^@*�<6z�RZ@�1Z���@d���RZ@���f��l�i��(��	4O�� ���"^@P�w{�O6@ů39Վ�??e-OA�'��CB<�<�.���0�]a�p�-4��4sz�0 ��/��*��:��k�@�ǚZN�z�h���@l�H%�<+(�e@�(}����I����T(��V���߿ߓJז@)q����!@�dT�s ���{�j�@��	Y�L�?�ڊ�B"0���9[F@0��X�nP�8B�(��ط���5@B�E��#@Ia:3X @�W�V�u��_�5�$:�6�i��Yq��^qx��o@
M����z@��u��?�QO�ʾ@�#K"`�?�&�����p����F�	j��?��<�����,�݁)4⿟�@��?{O���s�?�|�.�g��uv�������ă�?��_;\�?��".���?�&qr���?�K 	���0��Ǭ����Q�"�?xf�Q����{F�{��?�n������;����꿚��L��?����IJ@�������?:��3��$�o��
�?�XŶ|�����%�g�?/�M�6�G�ȿĿ����?�~c�SR㿯��RH��?<+(�e@*3�dX*�����	���&�P )��:'I�ռ�?"���F�?R������?����Y����H��N�?8oŜ��?��Ĉ
���Er�`8�@1�Vj���|�nu��Ql��@[7T$�y�?f�Ʌ&�?��B#�VE�$�,ً9�W���@��7���>@�R���I@�_�p��\k�%���*�(��,U�}@����UT&@���J���Q�DJ���t��B@�̊�z� ���R����ɧ@gGcN�������ΰ#+�D!�s�Y= j��� ��翝|]��2@C��J��܊�|� ���J�� # �@2�@��އ=�@'YT|�������Z�'�OIɒP�\�q�a@�m�?m�@"@)���
&@=���-@�)���?��fׯ���t{B�\@8e9��(}��������	��V/�$�#�:�f��@���`���?+]�H��Wzy��M���h@�c�=A0�6��y,w�?T�G�!@H�,f��7�w'�(��A@M!��	@w���yF'�t�	u������=�l�F��Sg@�TgD��*@�-�?��b@Y�.2a��W�5�l�kT"'�Р�/�5��ɒ�R�(���E�+@���Ն�5@Z:��#`����?��� /r���@�*_����,80�3�������u@\�?�����$`��r�+�j��8&'�g ����j��J�,@�)A����ɍ����������������@�ٱ`4�*@�)ʶ%"@#��� ������?7��#��#I����]H�[)@|�����?Kފ2@�:�_5@!�8_!!@�R��~@h;��:��5E�;�@3��!l �I����T(��&�P )��:�f��@`��y�ѿxu��+��?��D�.H��إ!���� ��!@�ok�Y��Mq��B�%]+1@�	���<G�c��k�*Q@C�%9��)@���4ɸ6�B�i�G"%���'m����v@z��W��:@��XGJr@g��XЏp�*6}�|��LY�C���X����[-��࿴�>Gy�?��D�Xj�?,&��%ſ.%��Ѧ�ji./{�?�<p�O��^�E�A�ۿ*�ȫI��?'���Ѧ����%ſ�)��*eտ��yب@�k};?J�h�Qx�?js��Ѧ���R�O���C��Ѧ����H}�?'���qb�?�8����? #X��?BM��h��X���g��?�?j,��?"]M����?��K^`�?y1�o���?�nnY��?nL~YX��?�>�t픿�7�MT��?��ٗ_ �?�V���߿:'I�ռ�?���`���?xu��+��?�G9�B�)�L����ĿtZ��ӿ�0���?"贈��?qJd=-����ж��?ɩ,����D���@�M����?&�̰��򿪀����忠�%�,��]����3@e{~Sy�?�R��1@d�����,�h�V��]9�~8>�(@9�Ev�}$@ɗUz�@�0�����*_+�x$���\�@;�����?����;�	�w� �@�q�̒\@E6�����.��1��?"d0K�@�ZF��l@EOg��5@r�e7�@�Fy=�*�оF!��?wk:��@�Q���?h�lJ���������NB��UǪ���?�̴��&@}�]¶��?&:fn��=��p%^㿳'X�~� ���%6>$��h�1h��A/+Ri��JDjԬ�@�b�� ���j�bm�?ߓJז@"���F�?+]�H���D�.H�L����Ŀݡ��1%�Jf�(W @�ٔ	:!�P��'��@Z��*	�?�W�Y.����Ӟ6@eLDn�@�tD�N���Y��]/&@>�~O�@\�^�"@�R�f��-2{�*�Դ�Noa�,�O� `@d��R�k@s|�P!@Ś���-@��㫧�!@I�=�"�����-���0\�@��r�G��?�]q����fQ�m�@�H��_!@��)�.]�F[4�J��?(�d]�@"�УXt@����j@�q�@���]Q#�6��=H��?�@�Fp�@4�H��?@��N���	�"��#�)�� ���?�~l*NF0@0���?^�E\-!�is����h�ҨpI(�!f���S-�v(\���i�1���E7�?��ɱA��i�0�?)q����!@R������?�Wzy���إ!�tZ��ӿJf�(W @^�(X��g�����t{#�@���*�?P2x��'�Pn��L@@�@p��G����#[^!��8�-$�/@��
�!@D����@,m���o�%ɨ�3���Z:Bi�d����&g@��j
��s@�����z-�qG,�m���AU ��Nda"@?~�U-@�e����
���T�j�3�Z2�U@���%����bW�s�o�+)]�@ŅQ_
j�ې{���
�M2���1��:8rEx�c�������c�#@�|� j���ov�������j��p/�6�@~~\�z�!@�=�0��@�|
餛�(q���.��
}����O�d��3!@(��@��?�����'@���F��,@�ד�}j@	��@������<���@�7�CGD���dT�s �����Y��M���h@��� ��!@�0���?�ٔ	:!��g����I�v���������f�߿I�
�$@'@���6�?�~����G@���c>�!@NйP(U.����A[��R!��Ʋl�pn@;`م�1@��?��h@��Ƣ+f�j�L�?�r�m�:��@M����/ @���@�>c���]�}L' ��A!@pe�w�?�<y�����c*�?��|��@�p��P���%�
w�?nV�!@��(��@���.w@������?�Ȱ/�8��)w�?Θ@*�?�
�w�?�^� � �L�`�?���9���	�
�c&6��?S`2p�!@nt�B��?̅�t�������ѿ�Y��v��:��������
��%�9��񿇓����?����l�?��p�?��{�j�@��H��N�?�c�=A0��ok�"贈��?P��'��@��t{#�@�������R���&�o�ԓ�g@�_4Ei��D�̣�1@k#8�E:�V,o�*��z��W�!@n��V�1@��ð�@�$�g�a��w��_%�+�Y�[��ǗCuY@I#/�Ose@�+�)��?	��?V� ��?���\�[�^Ds����� ���?8!"]�?&��eֿ�}&R��?����d��?����տP��_�?�����?�68q�Y@��&iE�?{'�l�D�?�������~��Z�?6
lU��?��Z�?Xq��_�?4@�<��7D�O)�m7/�?3sI���?��eb5�?��2�8�A��}��?`���j����K����VpX�4濴ⳇ��B��v�]�?>F��KJؿ�9X;�?��	Y�L�?8oŜ��?6��y,w�?Y��Mq�qJd=-��Z��*	�?���*�?���f�߿o�ԓ�g@��,�­*��UI~� ��!b�\,@��Ȁ͓��o�l2��]������?1��D�?��{����?����@=�>~��^���/�ī�5�w��}�"5@Ë#|A@�		�f/�-܎���;�T�T�\0�S�P�D�1@�y��<@$'>C���2�u��-��*օ#@���0�D����/��4h��"@F���w��Urn������r�����_O�%�� �6��-���2@�g�hu�����g�0�nހKu����� @\�SD#�1@����'@����E���C]�>�Ģ�T��U�h��0@l��ݸ�?a%�k]7@�ec7<@F�X�Z8&@>g��@�,�?����Q��P"@H�� N��ڊ�B"0���Ĉ
���T�G�!@�B�%]+1@��ж��?�W�Y.��P2x��'�I�
�$@'@�_4Ei��UI~� �Ϊ�o.%@il��N�;�嶸V@�^��
1@���>��<�k�+�D����$����~@��A@A>���1x@¦�f�u�*<�iS���k�e>M�E@�h��'"S@������F@]~��^H�'j�(tT�����2@�����@vNm[�9��vCN$/@� AvQ�E@�s����8�`�r��@!�u~��2@d��zc�-@��w�O�>@xYĴM@>qUI��x�@0��n'/@ͷ>Q�@`T�2V�6���R�8�G�L�uA�@���f��@� C.�T@?W��@;X�w�F����K)T�z���O��54�0S�C�l y>�v�G|�t(�0K�`H�#@2�2~8��ŔgQ @��9[F@Er�`8�@H�,f��7��	���<G�ɩ,�����Ӟ6@Pn��L@@���6�?��D�̣�1@�!b�\,@il��N���͠Y@�9��5l��������""X�K@+�vH#L@�>���B@��Ԯѿ��0e	�O�(@R¢ml��4��놂@��7�2Y�@�u*&�O�Z��[R3\�L��H�P�cБ�>�Q@����w�\@v��ɲ;�,9�i+"����5C@�
�8u�6�[P[�:'P�����>zB@R�7ll+"�Fs�ʲ;���:���5���S�fF�� H>�#�y�ǸD�R@z�f�j+"� R�v�6�P�brj+"�����!�@@��g2ÐQ@���K�G@7�1�E&�T�I��^���졕` ���|}�P@zx��@{ᮓqW@g�$�T\@7��
2vF@u�ؽ52@cU?l-��m�r$B@E�kg�'�0��X�nP�1�Vj��w'�(��A@c��k�*Q@�D���@eLDn�@��@p��G�~����G@k#8�E:���Ȁ͓�;�嶸V@�9��5l����%t@b"E��K@P��&�w[�(�7��dC�>� 2�jM��ہ�ڙ@ ]�ŕ#h@�)��9��@5_q�c�����6<a��@�_#O'�c r]�4�K���P(�&F��T*@$�`,p:@qp۩	�롾�D���ђ���@��C�b�b�0l)}'���t�@�w��A��g1��	��anl����ev ���ڸ���I�ҟ,@ٜ;�F��^Tc�b��ks�F��D{S4c�@r���؀*@`�C��+"@.�V����N�Ik
�6��|�����b�l�YW)@H�KEv�?wUZL�1@����A5@ugKW� @�J�,o�@��ЁyP�� }�@x�fO�H��8B�(��|�nu��M!��	@C�%9��)@�M����?tD�N������#[^!����c>�!@V,o�*���o�l2�鿜^��
1@������b"E��K@7�!��9J��<��S�Q@��C��c�Dej��@�
\�d�f�:�R*��V���&m�3j@�qO�u�v@��P�pq��N�5@��1��B@�Y(6@�|���*5�
sۘ�K��(=�"@��N��P@g��;(I)�1e��y@4��ϐ5@��ͬwQ(���h;�P@�k��"@���P�X@��CV�-@�l$�+�
@:e�8�ah4�P@eo3�y@�L��P@���P�	&�.���B7���G1�t/�Z����@V�IK1�D@�uL�|@\��o�6�l�0y}.�J�M���>�9� ��B�?��ɲ-�۫f���n���CN@sT�g�'��m
H@�ط���5@Ql��@w���yF'����4ɸ6�&�̰���Y��]/&@�8�-$�/@NйP(U.�z��W�!@]������?���>��""X�K@P��&�w[��<��S�Q@
+Z��n��ج�h}�@^c�uC��ZR��I�@
�|m�p@pn
V�E@`oL>����YH(S@�{k\[�"@J�t9,1@IdH��w$@q�s-X1�]�"8?@�j�_@�@B�����?�#yh��i�\O}@�ˤ�i#@SY��f)E>��?,9��M�@d@�٭	@��H���@]QGX��?/ۀ��&�.pWR��?��_}@|]�-��?���[����L:�ʒ%��g@tp��ڡ��'�?�\a�3@M
�	��?:Q��$�ZU����$�tW�.��s�RBq1��SZ�=����oh	��3V�g @��rQ��.������?B�E��#@[7T$�y�?t�	u���B�i�G"%��������>�~O�@��
�!@���A[�n��V�1@1��D�?�<�k�+�+�vH#L@(�7��dC���C��c��ج�h}�@e��͵��$���*q@�}�Z���ķ�Y:��a�2�������T�m�@�ڎ<u��@��	�)@��`/�*@-Z�V�� @(���Q����j�1�ЍJE\/@NΨ����?��G�]�n>��@�X6@ @4^�xjo��=�B���?|h�X[/@�����@^�ܔ%@�Eq��}�?��4n� �)�k����?�ߣ�@�����?y���D���5� �Ν�3i2�n.^2�?+Tӵ�-@8�A8B�?�h��[���`�٢ܿ[U�,�%��t/�J*�6��!Gw�0|Zw����O�5~�?��Xι��W-����?Ia:3X @f�Ʌ&�?���=���'m���%�,��\�^�"@D����@�R!���ð�@��{����?D����$��>���B@>� 2�jM�Dej��@^c�uC�$���*q@������S� n�;�j�����ө]@֔H����?A_��k&��@�Ө��u��i͵���ʄR�v��T���w@����"ۇ@�sq�Fnb����L�2H�e�z�_i@qYS��Y^�r�c�|u�2�)G�gh@��'��2H�� �Fnb���(=D ]�m(?�m�R�P�jLJ���:��x@�v��2H��P!?�Y^�0FO�2H������f@J(�iEw@���_�o@�gTny�M�G��G���3�-F���#v@�oP!B@n�x,��~@�dGܝÂ@O�c�m@�O����W@f��]S��th�g@�לM��O��W�V�u���B#�VE�l�F��Sg@���v@]����3@�R�f�,m���o��Ʋl�pn@�$�g�a�����@=����~@��Ԯѿ���ہ�ڙ@�
\�d�f��ZR��I�@�}�Z��� n�;�j��� �B]��HA��[����H
a�e@�!@	2$�@�>�&G����^9����F�s���=:������7@3x��R�[@F�w
7&�&����N�>4f�-@�B��H"�2ݤ;�9��7g�+@�؊�N�~�$�7&�����!���u�2��čoA��l��<�<@��N��R�H"�[|��N�D�x�)N)@��d�.;@��[@?=2@����~T�)�f�H�^��sH��@�_e�9@�Sd���@zЧ�A@u_���E@,J�ЊL1@�"/��@^�w��p���+@�H0�WO��_�5�$:�$�,ً9��TgD��*@z��W��:@e{~Sy�?�-2{�*�%ɨ�3�;`م�1@�w��_%�>~��^����A@0e	�O�(@ ]�ŕ#h@:�R*��V�
�|m�p@ķ�Y:������ө]@HA��[����Rԟ*���D#�nǬ@~Lg�~��@]�I����e��Aq�p�?d�}�*m�lw�q�v'�4t@����}@��Ry+]�����C�p���}�d@x�(�W��/�8�q���u���c@����C����Rz+]��P��V��JaD�g�)iW�p�C��SF�s@�b��C��j���W���åC������a@�!��еr@�7��qi@A(\Y�G����,g��e��r�@��Y�<�q@�k���>@��2?Z�x@0�kN�+~@�ޒ�|�g@=ހ|ЬS@r��=N�'i�jc@XP��VH�6�i��Yq�W���@��-�?��b@��XGJr@�R��1@Դ�Noa���Z:Bi���?��h@+�Y�[��/�ī�5�A>���1x@R¢ml���)��9��@��&m�3j@pn
V�E@a�2����֔H�����H
a�e@�D#�nǬ@lBV����7���@�&J�h�@U<D�,�n@�p`��>{@�S�p@݋3'��p�T��l���~h�Z@D���O�A@x��S�b�3�!b9V@*�G YCo@�bIl�a�1�@7M�A@��T�e�Z@Nf��(U@$3+�e@?{�(pC@�����q��}�R�A@k1g8V@S�4�R�A@=���( `��>���p��Kվ�f�r�3�tE@�W\�}@ٿ��[�?@Іխk!p�m��^�:��q�rv�����"S{��nD�A�e�z���Q���� L@�N^w|a�5��.�G@�^qx��o@�7���>@Y�.2a�g��XЏp�d�����,�,�O� `@d����&g@��Ƣ+f��ǗCuY@w��}�"5@¦�f�u�4��놂@5_q�c���qO�u�v@`oL>������T�m�@�?A_��!@	2$�@~Lg�~��@��7���@�:|d�m��Pi��5o��S����y@J�����@���@={@���b~��)���_C�4�f@�,�	X�M@�.���o�\��٢b@����gz@fS�ņLn�����\�M@�'^?5�f@Ψ�g��a@�"�vLr@��s���O@�z��`~�[?��[�M@�:��עb@՛;�[�M@ad��rk�9�C��|��+�OQ�s��7��"R@vd�)�N�@�1�
��J@��\�`{���z�F���I��/��$ok�:3����~
C`r����L�]�2k.F�W@��F��m�&E�?S@
M����z@�R���I@�W�5�l�*6}�|�h�V��]9�d��R�k@��j
��s@j�L�?�r�I#/�Ose@Ë#|A@*<�iS�����7�2Y�@���6<a����P�pq��YH(S@�ڎ<u��@�k&��@�>�&G��]�I�����&J�h�@Pi��5o���I[u�����t�b�
dL_dthetaL�j~  h�CCKE��έ����R��dL_dm�jy  uh�X�  
    Gaussian Process model for regression

    This is a thin wrapper around the models.GP class, with a set of sensible defaults

    :param X: input observations
    :param Y: observed values
    :param kernel: a GPy kernel, defaults to rbf
    :param Norm normalizer: [False]
    :param noise_var: the noise variance for Gaussian likelhood, defaults to 1.

        Normalize Y with the norm given.
        If normalizer is False, no normalization will be done
        If it is None, we use GaussianNorm(alization)

    .. Note:: Multiple independent outputs are allowed using columns of Y

    Inherited from GP: 

    General purpose Gaussian process model

    :param X: input observations
    :param Y: output observations
    :param kernel: a GPy kernel, defaults to rbf+white
    :param likelihood: a GPy likelihood
    :param inference_method: The :class:`~GPy.inference.latent_function_inference.LatentFunctionInference` inference method to use for this GP
    :rtype: model object
    :param Norm normalizer:
        normalize the outputs Y.
        Prediction will be un-normalized using this normalizer.
        If normalizer is True, we will normalize using Standardize.
        If normalizer is False, no normalization will be done.

    .. Note:: Multiple independent outputs are allowed using columns of Y


    
Inherited from Parameterized: 

    Say m is a handle to a parameterized class.

    Printing parameters::

        - print m:           prints a nice summary over all parameters
        - print m.name:      prints details for param with name 'name'
        - print m[regexp]: prints details for all the parameters
                             which match (!) regexp
        - print m['']:       prints details for all parameters

    Fields::

        Name:       The name of the param, can be renamed!
        Value:      Shape or value, if one-valued
        Constrain:  constraint of the param, curly "{c}" brackets indicate
                    some parameters are constrained by c. See detailed print
                    to get exact constraints.
        Tied_to:    which paramter it is tied to.

    Getting and setting parameters::

        - Set all values in param to one:      m.name.to.param = 1
        - Set all values in parameterized:     m.name[:] = 1
        - Set values to random values:         m[:] = np.random.norm(m.size)

    Handling of constraining, fixing and tieing parameters::

         - You can constrain parameters by calling the constrain on the param itself, e.g:

            - m.name[:,1].constrain_positive()
            - m.name[0].tie_to(m.name[1])

         - Fixing parameters will fix them to the value they are right now. If you change
           the parameters value, the param will be fixed to the new value!

         - If you want to operate on all parameters use m[''] to wildcard select all paramters
           and concatenate them. Printing m[''] will result in printing of all parameters in detail.
    
Inherited from Parameterizable: 

    A parameterisable class.

    This class provides the parameters list (ArrayList) and standard parameter handling,
    such as {link|unlink}_parameter(), traverse hierarchy and param_array, gradient_array
    and the empty parameters_changed().

    This class is abstract and should not be instantiated.
    Use paramz.Parameterized() as node (or leaf) in the parameterized hierarchy.
    Use paramz.Param() for a leaf in the parameterized hierarchy.
    
Inherited from OptimizationHandlable: 

    This enables optimization handles on an Object as done in GPy 0.4.

    `..._optimizer_copy_transformed`: make sure the transformations and constraints etc are handled
    
Inherited from Indexable: 

    Make an object constrainable with Priors and Transformations.

    TODO: Mappings!! (As in ties etc.)

    Adding a constraint to a Parameter means to tell the highest parent that
    the constraint was added and making sure that all parameters covered
    by this object are indeed conforming to the constraint.

    :func:`constrain()` and :func:`unconstrain()` are main methods here
    
Inherited from Nameable: 

    Make an object nameable inside the hierarchy.
    
Inherited from Gradcheckable: 

    Adds the functionality for an object to be gradcheckable.
    It is just a thin wrapper of a call to the highest parent for now.
    TODO: Can be done better, by only changing parameters of the current parameter handle,
    such that object hierarchy only has to change for those.
    
Inherited from Pickleable: 

    Make an object pickleable (See python doc 'pickling').

    This class allows for pickling support by Memento pattern.
    _getstate returns a memento of the class, which gets pickled.
    _setstate(<memento>) (re-)sets the state of the class to the memento
    
Inherited from object: 
The base class of the class hierarchy.

When called, it accepts no arguments and returns a new featureless
instance that has no instance attributes and cannot be given any.

Inherited from Parentable: 

    Enable an Object to have a parent.

    Additionally this adds the parent_index, which is the index for the parent
    to look for in its parameter list.
    
Inherited from Updateable: 

    A model can be updated or not.
    Make sure updates can be switched on and off.
    
Inherited from Observable: 

    Observable pattern for parameterization.

    This Object allows for observers to register with self and a (bound!) function
    as an observer. Every time the observable changes, it sends a notification with
    self as only argument to all its observers.
    
�ubh!h$K ��h&��R�(KK9K��h��B�  �_-���@�b���'@S1�5�6_?�|�ɫ$@�9�8�@�מY�0@�מY�0@[1|���#@                [1|���#@�מY�0@�מY�0@X)��h+@; u��@,@I�*��@���%+u(@�מY�0@        �מY�0@�gY�o�.@�ؐ��)@y`�iY&@        L="�=�?Dg-��@�s�/c4@���%+u@f��)���?�����?        ٜR$D�'@��6(�$@���V�/@��D��(@�מY�0@�מY�0@���V�/@f��)���?; u��@,@��6(�$@ٜR$D�@L="�=@I�*��+@8���-@�ť% @,,,��@ٜR$D�@�ť%@�[�.|\@,,,��@�[�.|\@f��)��
@���&M	@���&M	@f��)��
@���&M	@�O�Σ�?��]�2�?_�$y���?���0�P�?p 9�*��?��h�x@        ��h�x@        ��h�x@                ��h�x@��h�x@        ��h�x@+*�����?                        �Hh� �?        "+i���?�����?������?z:EL�?                2XDv4�?        ��jr��?        �9�D��?        �fg7�?s�����?s�����?��h�x@��h�x@�9�D��?��B�=b�?V�Da�(@��h�x@��E7~ @��֔��@6o��<�@                        ��B�=b�?�9�D��?������?2XDv4�?��B�=b�?B�9C_�?c�վ���?"+i���?�t�bh!h$K ��h&��R�(KK9K��h��B�  ���3p��?��V��?�\�����?�K�#��?p�ﺾ�?���k�p�?�4X��p�?���[���?H��p�?X��x�p�?`�x���?�4X��p�?���k�p�?(f�S���?�M�;�?p@�?���?�xjxQ�?�4X��p�?H��p�?�4X��p�?��h��?��ϡVT�?��F�)��?�;0X���?Hm�ݔ�?��³�8�?Xb�?�k�v��?8���<�?�ʜq��?H` n��?�,Mׄ]�?0�m�Ė�?��~H��?���Z�?8�[��?������?�� �H��?�C�{:p�?��I���?�8��n%�?X��d�`�?WXxEM�?hY*��?�֦5���?��6�N�?P�$���?䞆K�A�?��ݵ���? �����?@��op
�?�����?���h��?@6\Q���? �C7-��? �G��?���K��?�t�b��.