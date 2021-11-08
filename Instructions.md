
Setup project:
pip3 install torch==1.10.0+cu113 torchvision==0.11.1+cu113 torchaudio===0.10.0+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html



The programming part of assignment 2 will be released on Gradescope tomorrow Tuesday (26th October, 9.00am) and due Monday, 15th November, 11pm EST (Montreal time). You can find it in the Overleaf of the course and it must be submitted to Gradescope.

Guidelines

The assignment is to be done individually. You can discuss the assignment with classmates but do not share answers.

We recommend using Colab (or jupyter) notebooks to run your experiments. We provide a main.ipynb notebook that can be used with both Colab and Jupyter. Alternatively, you can simply use the run_exp.py script and execute in a terminal.

We provide a few public tests for you to ensure that your code outputs tensors of the right shapes. This is only to facilitate rapid iteration during development; the tests on Gradescope will evaluate the “correctness” of your code.

Your score for this assignment is partly based on the correctness of your code. A large part of the score is also based on a report that you will need to submit. Please read through all the questions carefully so that you do not miss important technical details.

The report must be written in LaTeX.

For parts of the programming assignment that do not have associated test cases on Gradescope, you need not submit code. Your score for these parts will be based on the quality of the report.

There is no limit on the number of Gradescope submissions you can make. You can resubmit as many times as you want before the due date. At any point in time, you can roll back to your best submission thus far, and mark that for submission (Gradescope logs a history of these submissions). For the report, you can reselect pages associated with a question even after the deadline (but before grading has started).

Cheers,

Leo





1.2:
Remember that targets is a 2D array, so targets[i] will return a whole row of indices.
Although you shouldn't be using the elements of targets to index from log_probas anyway for this problem, because there are built-in PyTorch functions that will lookup the probability of the correct index in the vocabulary directly from the target array.

I suggest you look at the page for torch.nn.functional.nll_loss() to see what it is expecting as input. This function will accept the full log_probas and targets matrices as they are (although note it expects the dimensions to be in a specific order) which removes the need to make your own list of samples for the correct outputs.

for mask: The hint is to have a look at the reduction parameter of the function.