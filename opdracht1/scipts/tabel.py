import numpy as np

ROWS = 10+1
COLUMNS = 4
X_STAR = 0

def func(a:float, x:float) -> float:
    return a*x

def create_table(a=1/3, x0=1):
    table = np.zeros((ROWS, COLUMNS))
    
    x = x0

    for iter in range(ROWS):
        # 
        epsilon = abs(X_STAR - x)

        table[iter][0] = x
        table[iter][1] = epsilon

        x = func(a, x)
    
    return table


def to_latex(table):
    PREFIX = r"""
\begin{table}[]
\begin{tabular}{lllll}
\rowcolor[HTML]{9AB4FF} 
\multicolumn{1}{c}{\cellcolor[HTML]{9AB4FF} row} & \multicolumn{1}{c}{\cellcolor[HTML]{9AB4FF} epsilon}\\ \hline
"""
    POSTFIX = r"""\end{tabular}
\end{table}
"""

    text = PREFIX
    for iter in range(ROWS):
        text += rf"{iter} & {table[iter][0]:.2E} \\ \hline"
    text += POSTFIX
    return text

def main():
    table = create_table()
    with open("../verslag/table.tex", 'w') as f:
        f.write(to_latex(table))

if __name__ == "__main__":
    main()