import tensorflow as tf
import numpy as np

# here is your X, you can modify it
X = np.array([0, 1] * 18).reshape((6, 6))

# k is k, you can modify it
k = 5
with tf.variable_scope('test') as scope:
    U = tf.get_variable(name='U', shape=[X.shape[0], k], dtype=tf.float32)
    V = tf.get_variable(name='V', shape=[k, X.shape[1]], dtype=tf.float32)
    
    truth = tf.constant(X)
    result = tf.matmul(U, V)
    
    mse_loss = tf.losses.mean_squared_error(truth, result)
    
    # 0.1 is lambda, you can modify it
    regu = tf.contrib.layers.l2_regularizer(scale=0.1)
    reg_loss = tf.contrib.layers.apply_regularization(regu, [U, V])
    
    loss = mse_loss + reg_loss

    # 0.01 is alpha, you can modify it
    step = tf.train.AdamOptimizer(0.01).minimize(loss)


sess = tf.Session()
sess.run(tf.global_variables_initializer())
for _ in range(5000):
    l, r, _ = sess.run([loss, result, step])

# l is loss, r is result of U * V, this is what you need, a reconstruction of X
print(l, r)
